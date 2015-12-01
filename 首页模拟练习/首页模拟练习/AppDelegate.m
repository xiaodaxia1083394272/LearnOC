//
//  AppDelegate.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "rootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window =[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];  //设定window的界限
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    self.window.rootViewController = tabBarController;
    
    ViewController *viewController = [[ViewController alloc]init];
    rootViewController *rootviewController = [[rootViewController alloc]init];
    
    UINavigationController *navViewController = [[UINavigationController alloc]initWithRootViewController:viewController];
    UINavigationController *navRootviewController = [[UINavigationController alloc]initWithRootViewController:rootviewController];
    
   
    navViewController.title = @"页面1";
    navRootviewController.title = @"页面2";            //编码的东西跟UI的东西是不同的，编码是在后台运行的，所以给个名字用title
    
    NSArray *controllers = [NSArray arrayWithObjects:navViewController,navRootviewController,nil];
    tabBarController.viewControllers = controllers;
    
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
