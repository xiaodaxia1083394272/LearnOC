//
//  ViewController.m
//  JustForTest
//
//  Created by xiaoyang on 16/4/27.
//  Copyright © 2016年 xiaoyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UIPickerViewAccessibilityDelegate,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong,nonatomic) NSArray *array;
@property (strong,nonatomic) NSArray *arrayTwo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _array = [NSArray arrayWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",nil];
    _arrayTwo = [NSArray arrayWithObjects:@"篮球",@"足球",@"排球",@"羽毛球",@"游泳",nil];
    
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _textField.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidEndEditing:(UITextField *)textField{

    [_pickView removeFromSuperview];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component ==0){
            return [_array count];
    }
    return [_arrayTwo count];

}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    if(component ==0){
            return [_array objectAtIndex:row];
    }
    return [_arrayTwo objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    if(component ==0){
         [_array objectAtIndex:row];
    }
    [_arrayTwo objectAtIndex:row];
}
- (IBAction)complete:(id)sender {
    NSInteger row = [_pickView selectedRowInComponent:0];
    NSInteger rowTwo = [_pickView selectedRowInComponent:1];
    _textField.text = [NSString stringWithFormat:@"%@zhi%@",[_array objectAtIndex:row],[_arrayTwo objectAtIndex:rowTwo]];
    [_pickView setHidden:NO];
}
- (IBAction)keyboardDismiss:(id)sender {
    [_textField resignFirstResponder];
    [_pickView setHidden:YES];
}

@end
