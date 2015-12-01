//
//  gynnasiumTableViewCell.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "gynnasiumTableViewCell.h"
#import "secondViewController.h"
#import "ViewController.h"
#import "mapViewViewController.h"
@implementation gynnasiumTableViewCell
- (void)awakeFromNib {
    // Initialization code
    
    [self.myImageView setImage:[UIImage imageNamed:@"1"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
+(id)creatCell{
    
    NSArray *cell = [[NSBundle mainBundle] loadNibNamed:@"gynnasiumTableViewCell" owner:self options:nil];
    if(cell==nil||[cell count]<=0){
        return nil;
    }
    return [cell  objectAtIndex:0];
}

+(NSString *)identifier {
    return @"name";
}

- (IBAction)buttonClick:(id)sender {

    [self.delegate didClickButton];
    
}

- (IBAction)mapViewButton:(id)sender {
    
    
    [self.delegate didMapViewButton];
    
}
- (IBAction)alphaButton:(id)sender {
    
    [self.delegate  didAlphaButton];
    
    
}



@end
