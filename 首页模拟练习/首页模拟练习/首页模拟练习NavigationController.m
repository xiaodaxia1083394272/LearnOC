//
//  首页模拟练习NavigationController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/12/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "首页模拟练习NavigationController.h"
#import "rootViewController.h"


@interface ______NavigationController ()
@property (weak ,nonatomic) id<pushDelegate> pushDelegate;
@end

@implementation ______NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self.pushDelegate pushViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (void)pushViewController;
//{
//    
//    if (self.viewControllers.count > 0) { 
//        viewController.hidesBottomBarWhenPushed = YES;
//        
//    }
//    //[self.navigationController pushViewController:ucenter animated:YES];
//    [super pushViewController:viewController animated:animated];
//}

@end
