//
//  twoTableViewCell.h
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  ButtonOneClickDelegate<NSObject>
@optional;

-(void)ButtonOneClick;

@end
@interface twoTableViewCell : UITableViewCell

+(id)creatCell;

@property (weak,nonatomic) id<ButtonOneClickDelegate> delegate;
           
@end
