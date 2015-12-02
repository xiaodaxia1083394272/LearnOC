//
//  mapViewViewController.h
//  首页模拟练习
//
//  Created by xiaoyang on 15/12/1.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KCAnnontation.h"
@interface mapViewViewController : UIViewController<MKMapViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>

//经度
@property (weak, nonatomic) IBOutlet UITextField *longitudeText;
//纬度
@property (weak, nonatomic) IBOutlet UITextField *latitudeText;
//地图
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//自己经度
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
//自己纬度
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;


-(void)addAnnotation1;


@end
