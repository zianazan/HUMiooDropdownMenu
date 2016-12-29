//
//  ViewController.m
//  HUMiooDropdownMenu
//
//  Created by 赵春生 on 2016/12/29.
//  Copyright © 2016年 赵春生. All rights reserved.
//
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
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HUMBtnClick:) name:@"HUMBtnClick" object:nil];
}

-(void)HUMBtnClick:(NSNotification *)text{
    NSLog(@"%@",[self.HUM returnResultArr]);
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
