//
//  MyPoint.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/12/1.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

-(id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t{
    self = [super init];
    if(self){
        _coordinate = c;
        _title = t;
    }
    return self;

}

@end
