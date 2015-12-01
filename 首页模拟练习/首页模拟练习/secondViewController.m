//
//  secondViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIButton *b;
    
    [b addTarget:self action:@selector(nilSymbol:) forControlEvents:UIControlEventAllEvents];
    
    
    NSURLRequest *requesst = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:requesst];
    [self.webView setBackgroundColor:[UIColor greenColor]];
    
    
}

- (IBAction)goForward:(id)sender {
    
    
    [self.webView goForward];
    
}
- (IBAction)back:(id)sender {
    
    [self.webView goBack];
    
}


@end
