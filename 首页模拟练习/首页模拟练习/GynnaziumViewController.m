//
//  GynnaziumViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/27.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "GynnaziumViewController.h"

@interface GynnaziumViewController ()

@end

@implementation GynnaziumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _gynnaziumWebView = [[UIWebView alloc]init];
    NSString *url =@"http://www.sinlang.com";
    NSURL *url1 = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [_gynnaziumWebView loadRequest:request];
    [self.view addSubview:_gynnaziumWebView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
