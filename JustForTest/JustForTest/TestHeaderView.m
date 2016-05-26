//
//  TestHeaderView.m
//  JustForTest
//
//  Created by xiaoyang on 16/5/26.
//  Copyright © 2016年 xiaoyang. All rights reserved.
//

#import "TestHeaderView.h"

@implementation TestHeaderView

+ (TestHeaderView *)createTestHeaderView{
    
    NSArray *topLevelObject = [[NSBundle mainBundle] loadNibNamed:@"TestHeaderView" owner:self options:nil];
    if ([topLevelObject count]<= 0){
        return nil;
    }
    TestHeaderView *view = [topLevelObject objectAtIndex:0];
    view.frame = [UIScreen mainScreen].bounds;
//    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //    view.contentHolderView.layer.cornerRadius = 30;
    return view;
}

- (void)show{
    /*
     当要背景颜色透明的时候，alpha导致subview也透明了解决方法
     (相当于改变uicolor的透明属性)
     1.xib中的background color 选others 里面有个opacity
     2.代码：backgroundColor = [uicolor colorwithRed:xx green:xx blue:xx alpha:xx];
     */
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];


    
}

@end
