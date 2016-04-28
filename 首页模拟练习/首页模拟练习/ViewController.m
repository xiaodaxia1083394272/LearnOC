//
//  ViewController.m
//  首页模拟练习
//
//  Created by xiaoyang on 15/11/23.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "ViewController.h"
#import "gynnasiumTableViewCell.h"
#import "twoTableViewCell.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "GynnaziumViewController.h"
#import "mapViewViewController.h"
#import "gynnasiunDetailViewController.h"
#import "LoginViewController.h"
#import "首页模拟练习NavigationController.h"
@interface ViewController ()<ButClickDelegate,ButClickDelegate,UIScrollViewDelegate,pushDelegate>
@property (strong, nonatomic) IBOutlet UIView *tabBarButtonOfTitleView;

@property (strong, nonatomic) UIScrollView *myScrollView;
@property (strong, nonatomic) UIPageControl *myPageControl;
@property (strong,nonatomic) UIButton *button1;
@property (assign, nonatomic) int type; //0显示第一种，1显示第二种
@property (strong,nonatomic)  IBOutlet UIButton *button;
+(NSString*)currentCityLocation;
@property (weak, nonatomic) IBOutlet UIImageView *titleViewImage;
@property (weak, nonatomic) IBOutlet UIView *viewForTitleView;

@end

@implementation ViewController
- (IBAction)tabBarButton:(id)sender {
    
    NSLog(@"nihao a");
}

+(NSString *)currentCityLocation{
    return @"广州";
    
}

- (void)gymnasiumSelect {
    
    GynnaziumViewController *gVC = [[GynnaziumViewController alloc]init];
    [self.navigationController pushViewController:gVC animated:YES];
    
 
}

-(void)citySelect{
   
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"网络不好" message:@"请重新加载" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"确定", nil];
    [alerView show];
    
}

-(void)login{
    LoginViewController *lVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:lVC animated:YES];
}
//-(void)one{
//    
//}
//
//-(void)two{
//    
//    
//}

   //集成下拉刷新
//
//-(void)setupRefresh
//{
//    //1.添加刷新控件
//    UIRefreshControl *control=[[UIRefreshControl alloc]init];
//    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:control];
//    
//    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
//    [control beginRefreshing];
//    
//    // 3.加载数据
//    [self refreshStateChange:control];
//}
//
///**
// *  UIRefreshControl进入刷新状态：加载最新的数据
// */
//-(void)refreshStateChange:(UIRefreshControl *)control
//{
//    // 3.发送请求
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    [mgr GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject){
//        
//        //1.获取数据，处理数据，传递数据给tableView,如：
//        
//        // 将最新的微博数据，添加到总数组的最前面
//        //        NSRange range = NSMakeRange(0, newStatuses.count);
//        //        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
//        //        [self.statuses insertObjects:newStatuses atIndexes:set];
//        
//        //2.刷新表格
//        [self.tableView reloadData];
//        
//        // 3. 结束刷新
//        [control endRefreshing];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        // 结束刷新刷新 ，为了避免网络加载失败，一直显示刷新状态的错误
//        [control endRefreshing];
//    }];
//}

-(void)scrollToNextPage:(id)sender
{
    NSInteger pageNum=self.pageControl.currentPage;
    CGSize viewSize=self.myScrollView.frame.size;
    
    if (pageNum == 2) {
        pageNum = 0;
    } else {
        pageNum ++;
    }
    
    CGRect rect=CGRectMake((pageNum)*viewSize.width, 0, viewSize.width, viewSize.height);
    
    
    
    [self.myScrollView scrollRectToVisible:rect animated:NO];
    [self.pageControl setCurrentPage:pageNum];
    
    
    //    pageNum++;
    //    if (pageNum==_imageArray.count) {
    //        CGRect newRect=CGRectMake(viewSize.width, 0, viewSize.width, viewSize.height);
    //        [self.myScrollView scrollRectToVisible:newRect animated:NO];
    //    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //集成刷新控件
//     [self setupRefresh];
    
    [_titleViewImage  setImage:[UIImage imageNamed:@"5"]];
    [_tabBarButtonOfTitleView setBackgroundColor:[UIColor colorWithRed:0.5 green:0 blue:0.5 alpha:0.5]];
    
    
    //UIPageControl
    CGFloat Width=self.myScrollView.frame.size.width;   //封装思想，比较好
    CGFloat Height=self.myScrollView.frame.size.height;

    
    
    
    //选位置button
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [_button1 setBackgroundColor:[UIColor colorWithRed:0 green:0.5 blue:0 alpha:0.5]];
    [_button1 setTitle:[ViewController currentCityLocation] forState:UIControlStateNormal];
    [_button1 addTarget:self  action:@selector(citySelect) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_button1];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    //登录button
    UIButton *buttonForRightBarButtonItem =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    [buttonForRightBarButtonItem setBackgroundColor:[UIColor colorWithRed:0 green:0.5 blue:0 alpha:0.5]];
    [buttonForRightBarButtonItem setTitle:@"登录" forState:UIControlStateNormal];
    buttonForRightBarButtonItem.titleLabel.font= [UIFont systemFontOfSize:12];//button文字的大小，当然systemFontOfSize还可以有其他内容，有时间就去细化一下
    [buttonForRightBarButtonItem addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonForRightBarButtonItem];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
////    
//    UIImageView * pleaseInputGynnaziumImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    [pleaseInputGynnaziumImage setImage:[UIImage imageNamed:@"5"]];
    
//    UIViewContentModeScaleToFill,
//    UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
//    UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
//    UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
//    UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
//    UIViewContentModeTop,
//    UIViewContentModeBottom,
//    UIViewContentModeLeft,
//    UIViewContentModeRight,
//    UIViewContentModeTopLeft,
//    UIViewContentModeTopRight,
//    UIViewContentModeBottomLeft,
//    UIViewContentModeBottomRight,
//
    
    //
    //pleaseInputGynnaziumImage.contentMode =   UIViewContentModeScaleAspectFit;
    
    //pleaseInputGynnaziumImage.userInteractionEnabled = NO;
  
//    pleaseInputGynnaziumImage.clipsToBounds = NO;

    
    _button =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [_button setBackgroundColor:[UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5]];
    [_button  setTitle:@"" forState:UIControlStateNormal];
    [_button setBackgroundImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
    [_button addTarget:self  action:@selector(citySelect) forControlEvents:UIControlEventTouchUpInside];
    // [_button setBackgroundImage:[UIImage imageNamed:@"register_back.png"]
//                      forState:UIControlStateNormal];
    //[button addTarget:self action:@selector(gymnasiumSelect) forControlEvents:UIControlEventTouchUpInside]; //手势触发目标执行选择器的方法
     //[button addTarget:self action:@selector(citySelect) forControlEvents:UIControlEventTouchUpInside];
     //[_button addTarget:([self action:@selector(citySelect) forControlEvents:UIControlEventTouchUpInside];
    // UIBarButtonItem *barButtonItemLeft =
   // [[UIBarButtonItem alloc] initWithCustomView:button]; //
    //中
    
    //self.navigationItem.titleView =_button;
    
    self.navigationItem.titleView = _button;
   
    

//    self.navigationItem.leftBarButtonItem = barButtonIteLeft;  //左边
    //self.navigationItem.rightBarButtonItem
   
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
   
//       width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
//     为0；width为正数时，正好相反，相当于往左移动width数值个像素
////    
//    button.width = -5;
//    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:barButtonIteLeft, btn_right, nil];
    
    
    UIScrollView * sCV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 420, 100)];
    sCV.backgroundColor =[UIColor grayColor];
    sCV.contentSize = CGSizeMake(sCV.frame.size.width * 3, sCV.frame.size.height);
    sCV.pagingEnabled = YES;
    self.myScrollView = sCV;   //这句啥意思   何必要赋值呢  实例出来为了永久持有吗，赋值是为了指定的意思吧
    self.myScrollView.delegate = self;
    
    
//    UIImageView *scrollViewImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 420, 100)];
//    [scrollViewImage setImage:[UIImage imageNamed:@"4"]];
//     [sCV addSubview:scrollViewImage];
    
    
    _imageArray =[[NSMutableArray alloc]init];
    _imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"], nil];
    UIImageView *firstView = [[UIImageView alloc] initWithImage:[_imageArray lastObject]];
    firstView.frame = CGRectMake(0, 0, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
    for(int i=0;i<[_imageArray count];i++){
        UIImageView *subViews = [[UIImageView alloc]initWithImage:[_imageArray objectAtIndex:i]];
        subViews.frame = CGRectMake(self.myScrollView.frame.size.width*(i), 0, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
        [self.myScrollView  addSubview:subViews];
    }
    
    UIImageView *lastView = [[UIImageView alloc] initWithImage:[_imageArray objectAtIndex:0]];
    lastView.frame = CGRectMake(Width*(_imageArray.count+1), 0, Width, Height);
    [self.myScrollView addSubview:lastView];
    _myTimer=[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
    

    
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    //[self.view backgroundColor:[UIColor greenColor]];
    [view addSubview:sCV];   //view为了显示     ；编码写出来的就是麻烦，还要add   view
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];    //分页控制算老几啊，跟viewcontroller有什么不同
    pageControl.bounds = CGRectMake(0, 0, 20, 20);      //这个控制很小的说
//    [self.pageControl setBounds:CGRectMake(0, 0, 16*(self.pageControl.numberOfPages-1), 16)];//设置pageControl中点的间距为16
//    [self.pageControl.layer setCornerRadius:8];//设置圆角
    
    //pageControl.center = CGPointMake(sCV.frame.size.width*0.5, sCV.frame.size.height-50);  //这才是点
    
    pageControl.frame = CGRectMake(45, 60, sCV.frame.size.width*0.5, sCV.frame.size.height-50); //不清楚点在哪，不过，这可以调点的位置
    
    pageControl.numberOfPages =3;        //分了多少页
    
    pageControl.pageIndicatorTintColor =[UIColor whiteColor];    //不选中页的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];  //选中页的颜色
    
    
    [pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];   //分页的实现转交给选择器处理
    
    self.myPageControl = pageControl;      //这句话是为了永久持有吗？？？？？？？？
    self.pageControl = pageControl;
    
    [view addSubview:pageControl];        //view又是addsubview，连控制页的控制器都要add，pagecontroller也是子view吗
    
    
    //view.backgroundColor = [UIColor blueColor];
    _tableView.tableHeaderView = view;     //最后最关键的一句话就是把add了pagecontroller和scrollView的view，add到tableheaderview上面去，敢情你这全是view的操作啊
    
    _buttonClear.backgroundColor = [UIColor clearColor];
    
//    self.type = 1;
//    [self.tableView reloadData];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);       //找出scrollView的x轴的内容偏移量，
    
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;  // 根据内容偏移量，确定当前页
    
    
    [self.myPageControl setCurrentPage:page];       //set当前页
    
     //UIImage *imageView1 = [[UIImage alloc]initWithCGImage:@"1"];
    //[self.view addSubview: [self.myPageControl setCurrentPage:page]];
    
    CGFloat pageWidth=self.myScrollView.frame.size.width;
    int currentPage=floor((self.myScrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    if (currentPage==0) {
        self.pageControl.currentPage=_imageArray.count-1;
    }else if(currentPage==_imageArray.count+1){
        self.pageControl.currentPage=0;
    }
    self.pageControl.currentPage=currentPage-1;
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_myTimer invalidate];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    _myTimer=[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth=self.myScrollView.frame.size.width;
    CGFloat pageHeigth=self.myScrollView.frame.size.height;
    int currentPage=floor((self.myScrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    NSLog(@"the current offset==%f",self.myScrollView.contentOffset.x);
    NSLog(@"the current page==%d",currentPage);
    
    if (currentPage==0) {
        [self.myScrollView scrollRectToVisible:CGRectMake(pageWidth*_imageArray.count, 0, pageWidth, pageHeigth) animated:NO];
        self.pageControl.currentPage=_imageArray.count-1;
        NSLog(@"pageControl currentPage==%d",self.pageControl.currentPage);
        NSLog(@"the last image");
        return;
    }else  if(currentPage==[_imageArray count]+1){
        [self.myScrollView scrollRectToVisible:CGRectMake(pageWidth, 0, pageWidth, pageHeigth) animated:NO];
        self.pageControl.currentPage=0;
        NSLog(@"pageControl currentPage==%d",self.pageControl.currentPage);
        NSLog(@"the first image");
        return;
    }
    self.pageControl.currentPage=currentPage-1;
    NSLog(@"pageControl currentPage==%d",self.pageControl.currentPage);
    
}
-(IBAction)pageTurn:(UIPageControl *)sender
{
    int pageNum=_pageControl.currentPage;
    CGSize viewSize=self.myScrollView.frame.size;
    [self.myScrollView setContentOffset:CGPointMake((pageNum+1)*viewSize.width, 0)];
    NSLog(@"myscrollView.contentOffSet.x==%f",_myScrollView.contentOffset.x);
    NSLog(@"pageControl currentPage==%d",self.pageControl.currentPage);   [_myTimer invalidate];
}












-(void)pageChange:(id)sender
{
    
    NSLog(@"123");
    
    UIPageControl *p = (UIPageControl *)sender;       //sender跟button那个一样吗
    CGFloat x =  p.currentPage * self.myScrollView.frame.size.width;  //当前页乘以scrollView的宽等于x轴
    
    [self.myScrollView setContentOffset:CGPointMake(x, 0) animated:YES];  //
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,320, 50)];
    UIButton *button1 = [[UIButton alloc]init];
    button1.backgroundColor = [UIColor grayColor];
    [button1 setTitle:@"推荐场馆" forState:UIControlStateNormal];
    button1.frame =  CGRectMake(60,10, 100,30);
    [button1 addTarget:self action:@selector(buttonToGynnazim) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = [UIColor grayColor];
    [button2 setTitle:@"推荐课程" forState:UIControlStateNormal];
    button2.frame =  CGRectMake(250,10,100,30);
    [button2 addTarget:self action:@selector(buttonToClub) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:button1];
    [view addSubview:button2];
    
    view.backgroundColor = [UIColor orangeColor];
    
    return view;
}


-(void)buttonToGynnazim{
    
        self.type = 0;
        [self.tableView reloadData];
}

-(void)buttonToClub{
    
    self.type =1;
    [self.tableView reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (self.type == 0) {
        
        gynnasiumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[gynnasiumTableViewCell identifier]];
        if (cell == nil){
            cell = [gynnasiumTableViewCell creatCell];
            cell.delegate = self;
        }
        
        return cell;
        
    } else {
        
        twoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name2"];
        
        if(cell==nil){
            cell = [twoTableViewCell creatCell];
            cell.delegate = self;
        }
        
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.type ==0){
        return 55.0;
    }else{
        return 200.0;
    }
    
    
}



//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"推荐场馆";
//}

//    self.type = 1;
//    [self.tableView reloadData];





- (void)didClickButton {
    
    secondViewController *sVC = [[secondViewController alloc]init];
    [self.navigationController pushViewController:sVC animated:YES];
    
}

-(void)didMapViewButton{
    
    mapViewViewController *mVVC =[[mapViewViewController alloc]init];
    [self.navigationController pushViewController:mVVC animated:YES];
    
    
}
-(void)ButtonOneClick {
    
    thirdViewController *tVC = [[thirdViewController alloc]init];
    [self.navigationController pushViewController:tVC animated:YES];
}

-(void)didAlphaButton{
    
    gynnasiunDetailViewController *gDVC = [[gynnasiunDetailViewController alloc]init];
    [self.navigationController pushViewController:gDVC animated:YES];
    
}
@end
