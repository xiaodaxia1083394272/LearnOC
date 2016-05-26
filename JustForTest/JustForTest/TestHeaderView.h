//
//  TestHeaderView.h
//  JustForTest
//
//  Created by xiaoyang on 16/5/26.
//  Copyright © 2016年 xiaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIView *contentHolderView;
+ (TestHeaderView *)createTestHeaderView;
- (void)show;

@end
