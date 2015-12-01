//
//  mapViewViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/12/1.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "mapViewViewController.h"
#import "MyPoint.h"

@interface mapViewViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation mapViewViewController

    //二，然后 实现方法即可
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    
    [self.view endEditing:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //一，添加手势
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    
    
    [self.view addGestureRecognizer:tap1];
    
    
    
    
    //手机定位设置
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    
//
    
    //设置MapView的委托为自己Ó
    [self.mapView setDelegate:self];
    
    //标注自身位置
    [self.mapView setShowsUserLocation:YES];
    
    
    
    
    //创建CLLocation 设置经纬度
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:[[self.latitudeText text] floatValue] longitude:[[self.longitudeText text] floatValue]];
    CLLocationCoordinate2D coord = [loc coordinate];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    CLLocationCoordinate2D loc = [userLocation coordinate];
//    //放大地图到自身的经纬度位置。
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
//    [self.mapView setRegion:region animated:YES];
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    //显示到label上
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",loc.longitude];
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",loc.latitude];
    
    //放大地图到自身的经纬度位置。
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.mapView setRegion:region animated:YES];
    
}
- (IBAction)touchDownBackground:(id)sender {
    [self.longitudeText resignFirstResponder];
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"didFailToLocateUserWithError");
}

//放置标注
- (IBAction)annotationAction:(id)sender {
    
    float la = [[self.latitudeText text] floatValue];
    float lo = [[self.longitudeText text] floatValue];
    
    if( (-180<=la && la<=180)
       &&(-90<=lo && lo<=90) ) {
    //创建CLLocation 设置经纬度
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:[[self.latitudeText text] floatValue] longitude:[[self.longitudeText text] floatValue]];
    CLLocationCoordinate2D coord = [loc coordinate];
    //创建标题
    NSString *titile = [NSString stringWithFormat:@"%f,%f",coord.latitude,coord.longitude];
    MyPoint *myPoint = [[MyPoint alloc] initWithCoordinate:coord andTitle:titile];
    //添加标注
    [self.mapView addAnnotation:myPoint];
    
    //放大到标注的位置
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [self.mapView setRegion:region animated:YES];
    }else{
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:nil message:@"输入的经度或者纬度不合法" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alerView show];
        
        
    }
    
    
}
//
//另外还可以使用[self.mapView addAnnotations:NSArray]这个方法，这个方法的参数是一个数组对象，可以同时给地图上添加多个标注。

@end
