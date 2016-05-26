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
    return view;
}

@end
