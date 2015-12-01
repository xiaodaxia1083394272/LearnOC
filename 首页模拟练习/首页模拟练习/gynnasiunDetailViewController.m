//
//  gynnasiunDetailViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/12/1.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "gynnasiunDetailViewController.h"

@interface gynnasiunDetailViewController ()

@end

@implementation gynnasiunDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellId = @"name";
    UITableViewCell *cell =nil;
    if(cell==nil){
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}
@end
