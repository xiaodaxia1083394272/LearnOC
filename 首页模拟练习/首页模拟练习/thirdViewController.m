//
//  thirdViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "thirdViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
  
    NSString *url = @"http://www.baidu.com";
    NSURL *url1 = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];
  NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    _textView.text =result;
}





@end
