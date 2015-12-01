//
//  twoTableViewCell.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "twoTableViewCell.h"

@implementation twoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id)creatCell{
    
    NSArray *cell = [[NSBundle mainBundle] loadNibNamed:@"twoTableViewCell" owner:self options:nil];
    if(cell==nil||[cell count]<=0){
        return nil;
    }
    return [cell  objectAtIndex:0];
}
- (IBAction)clickButton:(id)sender {
    
    UIButton *b = (UIButton *)sender;
    if(b.tag ==1){
        NSLog(@"nihao");
    }else if(b.tag ==2){
        NSLog(@"second");
    }
}
- (IBAction)clickButton5:(id)sender {
    
    [self.delegate  ButtonOneClick];
    
    
}
@end
