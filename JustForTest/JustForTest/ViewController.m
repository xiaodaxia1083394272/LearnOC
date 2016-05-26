//
//  ViewController.m
//  JustForTest
//
//  Created by xiaoyang on 16/4/27.
//  Copyright © 2016年 xiaoyang. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)a:(id)sender {
    TestViewController *testViewController = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testViewController animated:YES];
}

@end
