//
//  TestViewController.m
//  JustForTest
//
//  Created by xiaoyang on 16/5/25.
//  Copyright © 2016年 xiaoyang. All rights reserved.
//

#import "TestViewController.h"
#import "TestHeaderView.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UIView *firstHolderView;
@property (weak, nonatomic) IBOutlet UIView *secondHolderView;
@property (weak, nonatomic) IBOutlet UIView *thirdHolderView;
@property (strong, nonatomic) IBOutlet UIView *thirdHolderViewConstrain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *testConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondConstraintHeight;
@property (assign, nonatomic) CGFloat constraintHeight;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    
//    
//    self.navigationController.navigationBar.frame = CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width, 100);
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    
    [self.navigationController.navigationBar setTranslucent:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)a:(id)sender {
    self.secondHolderView.hidden = YES;
    self.testConstraint.constant = -MAX(129,_constraintHeight);//凡是处理过约束的都会保留有残留，可能要进行相应的挑选
    TestHeaderView *testHeaderView = [TestHeaderView createTestHeaderView];
    [testHeaderView show];
}
- (IBAction)b:(id)sender {
    self.secondHolderView.hidden = NO;
    self.testConstraint.constant = 15;//
    [self noName];


}

- (void)noName{
//    NSArray *valueList = [group objectForKey:name];
    _constraintHeight = 0;
    NSArray *valueList = [[NSArray alloc] init];
    valueList = [NSArray arrayWithObjects:@"nihao",@"nihaoma",@"haoma",@"comeOnba", nil];
    for (NSString *oneValue in valueList) {
        UILabel *valueLabel = [[UILabel alloc] init];
        valueLabel.font = [UIFont systemFontOfSize:14];
        valueLabel.backgroundColor = [UIColor clearColor];
        valueLabel.textColor = [UIColor blackColor];
        valueLabel.text = oneValue;
        
        
//        self.secondHolderView.translatesAutoresizingMaskIntoConstraints = NO;
        valueLabel.translatesAutoresizingMaskIntoConstraints = NO; //不用上一句原因，或许是因为原父view已经自动布局了，就不用除去resizing，而刚创建的label可能默认有resizing，所以要除去
        
        [self.secondHolderView addSubview:valueLabel];
        

        
        
        NSLayoutConstraint *l1 = [NSLayoutConstraint
                                  constraintWithItem:valueLabel
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:1
                                  constant:100];
        
        NSLayoutConstraint *l2 = [NSLayoutConstraint
                                  constraintWithItem:valueLabel
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:1
                                  constant:50];
        
        NSLayoutConstraint *l3 = [NSLayoutConstraint
                                  constraintWithItem:valueLabel
                                  attribute:NSLayoutAttributeLeading
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:self.secondHolderView
                                  attribute:NSLayoutAttributeLeading
                                  multiplier:1
                                  constant:0];
        
        NSLayoutConstraint *l4 = [NSLayoutConstraint
                                  constraintWithItem:valueLabel
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:self.secondHolderView
                                  attribute:NSLayoutAttributeTop
                                  multiplier:1
                                  constant:_constraintHeight];
        
//        NSLog(@"l1:%@, l2：%@， l3:%@, l4:%@", l1, l2, l3, l4);
        
        [valueLabel addConstraint:l1];
        
        [valueLabel addConstraint:l2];
        
        [self.secondHolderView addConstraint:l3];
        
        [self.secondHolderView addConstraint:l4];


        
        _constraintHeight +=60;
        
//        break;
    }
    
    self.secondConstraintHeight.constant = _constraintHeight;

}

@end





















