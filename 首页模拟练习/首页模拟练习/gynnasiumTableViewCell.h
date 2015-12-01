//
//  gynnasiumTableViewCell.h
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButClickDelegate <NSObject>

@optional
- (void)didClickButton;
-(void) didMapViewButton;
-(void) didAlphaButton;


@end


@interface gynnasiumTableViewCell : UITableViewCell<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong,nonatomic) UIWebView *myWebView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) id<ButClickDelegate> delegate;

+(id)creatCell;
+(NSString *)identifier;

@end
