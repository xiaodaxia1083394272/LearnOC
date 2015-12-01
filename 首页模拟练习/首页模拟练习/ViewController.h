//
//  ViewController.h
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;

@property(strong,nonatomic) NSMutableArray *imageArray;
@property (strong,nonatomic) NSTimer *myTimer;
@property (strong,nonatomic)   UIPageControl *pageControl;

@end

