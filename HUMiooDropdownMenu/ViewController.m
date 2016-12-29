//
//  ViewController.m
//  HUMiooDropdownMenu
//
//  Created by 赵春生 on 2016/12/29.
//  Copyright © 2016年 赵春生. All rights reserved.
//
#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
/**
 *  状态栏(statusbar)
 */
#define statusHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
/**
 *  导航栏（navigationbar）
 */
#define navigationBarHeight (self.navigationController.navigationBar.frame.size.height)
/**
 *  tabBar高度
 */
#define tabBarHeight [[UITabBarController alloc] init].tabBar.frame.size.height
#import "ViewController.h"
#import "HUMiooDropdownMenu.h"

@interface ViewController ()
@property (nonatomic, strong) HUMiooDropdownMenu *HUM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *mainArr = [NSMutableArray arrayWithObjects:@"综合",@"销量",@"价格", nil];
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"综合",@"品牌",@"风格", nil];
    NSMutableArray *ppArr = [NSMutableArray arrayWithObjects:@"A",@"B",@"C", nil];
    NSMutableArray *fgArr = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"默认综合排序",@"销量由低到高",@"销量由高到低", nil];
    NSMutableArray *arr3 = [NSMutableArray arrayWithObjects:@"默认综合排序",@"价格从低到高",@"价格从高到低", nil];
    
    CGRect frame = CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 40);
    
    self.HUM = [[HUMiooDropdownMenu alloc]initWithHUMiooframe:frame mainArr:mainArr arr1:arr1 ppArr:ppArr fgArr:fgArr arr2:arr2 arr3:arr3];
    self.HUM.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.HUM];
    
    /**
     * 返回结果数组事件
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HUMBtnClick:) name:@"HUMBtnClick" object:nil];
    /**
     * 改变HUM点击响应区域
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HUMframe:) name:@"HUMframe" object:nil];
}
-(void)HUMBtnClick:(NSNotification *)text{
    NSLog(@"%@",[self.HUM returnResultArr]);
//    self.HUM.frame = CGRectMake(0, 0, screenWidth, navigationBarHeight + statusHeight + 40);
}
-(void)HUMframe:(NSNotification *)text{
    if ([text.userInfo[@"text"] isEqualToString:@"remove"]) {
        NSLog(@"remove");
//        self.HUM.frame = CGRectMake(0, 0, screenWidth, navigationBarHeight + statusHeight + 40);
    }else{
        NSLog(@"create");
//        self.HUM.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.HUM dissmiss];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
