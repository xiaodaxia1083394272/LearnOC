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
    
    
    //地图类型
    _mapView.mapType = MKMapTypeStandard;
    
//    _mapView.mapType = MKMapTypeSatellite;
    //_mapView.mapType = MKMapTypeHybrid;
    //_mapView.mapType = MKMapTypeSatelliteFlyover;
   // _mapView.mapType = MKMapTypeHybridFlyover;
    //一，添加手势
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = YES;  //什么用
    
    
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
    NSString *titile =[NSString stringWithFormat:@"%f,%f",coord.latitude,coord.longitude];
    MyPoint *myPoint = [[MyPoint alloc] initWithCoordinate:coord andTitle:titile];
    //添加标注大头针
    //[self.mapView addAnnotation:myPoint];
        [self addAnnotation1];
    //放大到标注的位置
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [self.mapView setRegion:region animated:YES];
    }else{
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:nil message:@"输入的经度或者纬度不合法" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alerView show];
        
        
    }
    
    
}
-(void)addAnnotation1{
    //CLLocationCoordinate2D location1=CLLocationCoordinate2DMake(5, 6);
   
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:[[self.latitudeText text] floatValue] longitude:[[self.longitudeText text] floatValue]];
   CLLocationCoordinate2D coord = [loc coordinate];
    
    KCAnnontation *annotation1=[[KCAnnontation alloc]init];
    annotation1.title=@"CMJ Studio";
    annotation1.subtitle=@"Kenshin Cui's Studios";
    annotation1.coordinate=coord;
    annotation1.image=[UIImage imageNamed:@"1"];
    [_mapView addAnnotation:annotation1];
    
   // CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(39.87, 116.35);
  
    KCAnnontation *annotation2=[[KCAnnontation alloc]init];
    annotation2.title=@"Kenshin&Kaoru";
    annotation2.subtitle=@"Kenshin Cui's Home";
    annotation2.coordinate=coord;
    annotation2.image=[UIImage imageNamed:@"2"];
    [_mapView addAnnotation:annotation2];
}//
//另外还可以使用[self.mapView addAnnotations:NSArray]这个方法，这个方法的参数是一个数组对象，可以同时给地图上添加多个标注。

#pragma mark - 地图控件代理方法
#pragma mark 显示大头针时调用，注意方法中的annotation参数是即将显示的大头针对象
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[KCAnnontation class]]) {
        static NSString *key1=@"name";
        MKAnnotationView *annotationView=[_mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        //如果缓存池中不存在则新建
        if (!annotationView) {
            annotationView=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
            //            annotationView.canShowCallout=true;//允许交互点击
            //annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
            //annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];//定义详情左侧视图
        }
        
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation=annotation;
        annotationView.image= @"1";                 ((KCAnnontation *)annotation).image;//设置大头针视图的图片
        
        return annotationView;
    }else{
        return nil;
    }
}


@end
