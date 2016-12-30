//
//  HUMiooDropdownMenu.m
//  Tool
//
//  Created by 赵春生 on 2016/12/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//
#define HUMwindow_h ([UIScreen mainScreen].bounds.size.height)
#define HUMwindow_w ([UIScreen mainScreen].bounds.size.width)
#define HUMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HUMgrayTintColor HUMColor(219, 219, 219)

#import "HUMiooDropdownMenu.h"
#import "HUMiooFirstTableViewCell.h"
@interface HUMiooDropdownMenu ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic,strong) UIView *shadowView;

@property (nonatomic,strong) UIView *backView;

@property (nonatomic,strong) UIView *backView1;
@property (nonatomic,strong) UIView *backView1Son1View;
@property (nonatomic,strong) UIView *backView1Son2View;

@property (nonatomic,strong) UIView *backView2;
@property (nonatomic,strong) UIView *backView3;

@property (nonatomic,strong) UITableView *firstTable;

@property (nonatomic,strong) NSMutableArray *mainArr;
@property (nonatomic,strong) NSMutableArray *arr1;
@property (nonatomic,strong) NSMutableArray *ppArr;
@property (nonatomic,strong) NSMutableArray *fgArr;
@property (nonatomic,strong) NSMutableArray *arr2;
@property (nonatomic,strong) NSMutableArray *arr3;

@property (nonatomic) CGRect sframe;

@end
@implementation HUMiooDropdownMenu
-(NSMutableArray *)ResultArr{
    if (!_ResultArr) {
        _ResultArr = [[NSMutableArray alloc]init];
    }
    return _ResultArr;
}
- (instancetype)initWithHUMiooframe:(CGRect)frame mainArr:(NSMutableArray *)mainArr arr1:(NSMutableArray *)arr1 ppArr:(NSMutableArray *)ppArr fgArr:(NSMutableArray *)fgArr arr2:(NSMutableArray *)arr2 arr3:(NSMutableArray *)arr3{
    if (self = [super init]) {
        self.mainArr = mainArr;
        self.arr1 = arr1;
        self.arr2 = arr2;
        self.arr3 = arr3;
        self.ppArr = ppArr;
        self.fgArr = fgArr;
        self.ResultArr = [[NSMutableArray alloc]initWithArray:mainArr];
        
        [self createbackView:frame];
        [self createfirstTableView:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        self.sframe = frame;
    }
    return self;
}
/**
 * 创建backView
 */
-(void)createbackView:(CGRect)frame{
    UIView *backView = [[UIView alloc]initWithFrame:frame];
    backView.userInteractionEnabled = YES;
    backView.backgroundColor = [UIColor whiteColor];
    self.backView = backView;
    [self addSubview:backView];
}
/**
 * 创建阴影shadowView
 */
-(void)createshadowView:(CGRect)frame{
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, frame.origin.y + 40, HUMwindow_w, HUMwindow_h - frame.origin.y + 40)];
    bgV.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.3];
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [bgV addGestureRecognizer:singleTap];
    singleTap.delegate = self;
    singleTap.cancelsTouchesInView = NO;
    
    self.shadowView = bgV;
    [self addSubview:bgV];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender {
    [self.backView1 removeFromSuperview];
    [self.backView1Son1View removeFromSuperview];
    [self.backView1Son2View removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"remove"}]];
}
/**
 * 创建综合backView1
 */
-(void)createbackView1:(CGRect)frame{
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.origin.y + 40, ([UIScreen mainScreen].bounds.size.width)/2, self.arr1.count*40)];
    backView1.userInteractionEnabled = YES;
    backView1.backgroundColor = [UIColor whiteColor];
    self.backView1 = backView1;
    [self addSubview:backView1];
    
    for (int i = 0; i < self.arr1.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40*i, ([UIScreen mainScreen].bounds.size.width)/2, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.userInteractionEnabled = YES;
        btn.tag = 91001 + i;
        [btn addTarget:self action:@selector(arr1BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.arr1[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"HUMarrowRight_btn_normal"] forState:UIControlStateNormal];
        [btn layoutIfNeeded];
        btn.imageEdgeInsets = UIEdgeInsetsMake(10, ([UIScreen mainScreen].bounds.size.width)/2 - 10, 10, 20);
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(8, 39, ([UIScreen mainScreen].bounds.size.width)/2 - 16, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [btn addSubview:separatorView];
        
        [self.backView1 addSubview:btn];
    }
}
/**
 * 创建综合backView1Son1View
 */
-(void)createbackView1Son1View:(CGRect)frame{
    UIView *backView1Son1View = [[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2, frame.origin.y + 40, ([UIScreen mainScreen].bounds.size.width)/2, self.ppArr.count*40)];
    backView1Son1View.userInteractionEnabled = YES;
    backView1Son1View.backgroundColor = [UIColor whiteColor];
    self.backView1Son1View = backView1Son1View;
    [self addSubview:backView1Son1View];
    
    for (int i = 0; i < self.ppArr.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(8, 40*i, ([UIScreen mainScreen].bounds.size.width)/2 - 8, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.userInteractionEnabled = YES;
        btn.tag = 80001 + i;
        [btn addTarget:self action:@selector(ppArrBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.ppArr[i] forState:UIControlStateNormal];
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, ([UIScreen mainScreen].bounds.size.width)/2 - 8, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [btn addSubview:separatorView];
        
        [self.backView1Son1View addSubview:btn];
    }
}
/**
 * 创建综合backView1Son2View
 */
-(void)createbackView1Son2View:(CGRect)frame{
    UIView *backView1Son2View = [[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2, frame.origin.y + 40, ([UIScreen mainScreen].bounds.size.width)/2, self.fgArr.count*40)];
    backView1Son2View.userInteractionEnabled = YES;
    backView1Son2View.backgroundColor = [UIColor whiteColor];
    self.backView1Son2View = backView1Son2View;
    [self addSubview:backView1Son2View];
    
    for (int i = 0; i < self.fgArr.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(8, 40*i, ([UIScreen mainScreen].bounds.size.width)/2 - 8, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.userInteractionEnabled = YES;
        btn.tag = 81001 + i;
        [btn addTarget:self action:@selector(fgArrBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.fgArr[i] forState:UIControlStateNormal];
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, ([UIScreen mainScreen].bounds.size.width)/2 - 8, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [btn addSubview:separatorView];
        
        [self.backView1Son2View addSubview:btn];
    }
}
/**
 * 创建销量backView2
 */
-(void)createbackView2:(CGRect)frame{
    UIView *backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.origin.y + 40, [UIScreen mainScreen].bounds.size.width, self.arr2.count*40)];
    backView2.userInteractionEnabled = YES;
    backView2.backgroundColor = [UIColor whiteColor];
    self.backView2 = backView2;
    [self addSubview:backView2];
    
    for (int i = 0; i < self.arr2.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(8, 40*i, [UIScreen mainScreen].bounds.size.width - 8, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.userInteractionEnabled = YES;
        btn.tag = 92001 + i;
        [btn addTarget:self action:@selector(arr2BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.arr2[i] forState:UIControlStateNormal];
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, [UIScreen mainScreen].bounds.size.width, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [btn addSubview:separatorView];
        
        [self.backView2 addSubview:btn];
    }
}
/**
 * 创建价格backView3
 */
-(void)createbackView3:(CGRect)frame{
    UIView *backView3 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.origin.y + 40, [UIScreen mainScreen].bounds.size.width, self.arr3.count*40)];
    backView3.userInteractionEnabled = YES;
    backView3.backgroundColor = [UIColor whiteColor];
    self.backView3 = backView3;
    [self addSubview:backView3];
    
    for (int i = 0; i < self.arr2.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(8, 40*i, [UIScreen mainScreen].bounds.size.width - 8, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.userInteractionEnabled = YES;
        btn.tag = 93001 + i;
        [btn addTarget:self action:@selector(arr3BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.arr3[i] forState:UIControlStateNormal];
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, [UIScreen mainScreen].bounds.size.width, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [btn addSubview:separatorView];
        
        [self.backView3 addSubview:btn];
    }
}
#pragma mark - UITableViewDataSource and Delegate
/**
 * 创建标题头firstTable
 */
-(void)createfirstTableView:(CGRect)frame{
    UITableView *firstTV = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    firstTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    firstTV.delegate = self;
    firstTV.dataSource = self;
    [self.backView addSubview:firstTV];
    self.firstTable = firstTV;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID1 = @"HUMcell";
    HUMiooFirstTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID1];
    if (!cell1) {
        cell1 = [[HUMiooFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID1];
    }
    [cell1.Btn1 setTitle:self.ResultArr[0] forState:UIControlStateNormal];
    [cell1.Btn2 setTitle:self.ResultArr[1] forState:UIControlStateNormal];
    [cell1.Btn3 setTitle:self.ResultArr[2] forState:UIControlStateNormal];
    [cell1.Btn1 addTarget:self action:@selector(FirstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell1.Btn2 addTarget:self action:@selector(FirstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell1.Btn3 addTarget:self action:@selector(FirstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell1;
}
-(void)FirstBtnClick:(UIButton *)sender{
    UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
    UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
    UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
    if (sender.tag == 90001) {
        [self.backView2 removeFromSuperview];
        [self.backView3 removeFromSuperview];
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        
        if (sender.selected) {
            [self.shadowView removeFromSuperview];
            [self.backView1 removeFromSuperview];
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"remove"}]];
            [UIButton animateWithDuration:0.5 animations:^{
                sender.imageView.transform = CGAffineTransformMakeRotation(0);
            } completion:nil];
        }else{
            [self.shadowView removeFromSuperview];
            
            [self createshadowView:self.sframe];
            [self createbackView1:self.sframe];
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"create"}]];
            [UIButton animateWithDuration:0.5 animations:^{
                sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            } completion:nil];
        }
        sender.selected = !sender.selected;
        btn2.selected = NO;
        btn3.selected = NO;
        [UIButton animateWithDuration:0.5 animations:^{
            btn2.imageView.transform = CGAffineTransformMakeRotation(0);
            btn3.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
    }else if (sender.tag == 90002) {
        [self.backView1 removeFromSuperview];
        [self.backView3 removeFromSuperview];
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"remove"}]];
        [UIButton animateWithDuration:0.5 animations:^{
            sender.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
        if (sender.selected) {
            [self.shadowView removeFromSuperview];
            [self.backView2 removeFromSuperview];
        }else{
            [self.shadowView removeFromSuperview];
            
            [self createshadowView:self.sframe];
            [self createbackView2:self.sframe];
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"create"}]];
            [UIButton animateWithDuration:0.5 animations:^{
                sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            } completion:nil];
        }
        sender.selected = !sender.selected;
        btn1.selected = NO;
        btn3.selected = NO;
        [UIButton animateWithDuration:0.5 animations:^{
            btn1.imageView.transform = CGAffineTransformMakeRotation(0);
            btn3.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
    }else {
        [self.backView1 removeFromSuperview];
        [self.backView2 removeFromSuperview];
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"remove"}]];
        [UIButton animateWithDuration:0.5 animations:^{
            sender.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
        if (sender.selected) {
            [self.shadowView removeFromSuperview];
            [self.backView3 removeFromSuperview];
        }else{
            [self.shadowView removeFromSuperview];
            
            [self createshadowView:self.sframe];
            [self createbackView3:self.sframe];
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMframe" object:nil userInfo:@{@"text":@"create"}]];
            [UIButton animateWithDuration:0.5 animations:^{
                sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            } completion:nil];
        }
        sender.selected = !sender.selected;
        btn2.selected = NO;
        btn1.selected = NO;
        [UIButton animateWithDuration:0.5 animations:^{
            btn2.imageView.transform = CGAffineTransformMakeRotation(0);
            btn1.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
    }
}
#pragma mark - 按钮点击事件
-(void)arr1BtnClick:(UIButton *)sender{
    if (sender.tag == 91001) {
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        
        self.ResultArr = [[NSMutableArray alloc]initWithArray:self.mainArr];
        
        [self.backView1 removeFromSuperview];
        [self.backView2 removeFromSuperview];
        [self.backView3 removeFromSuperview];
        [self.shadowView removeFromSuperview];
        
        [self.firstTable reloadData];
        
        UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
        UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
        UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
        btn1.selected = NO;
        btn2.selected = NO;
        btn3.selected = NO;
        [UIButton animateWithDuration:0.5 animations:^{
            btn1.imageView.transform = CGAffineTransformMakeRotation(0);
            btn2.imageView.transform = CGAffineTransformMakeRotation(0);
            btn3.imageView.transform = CGAffineTransformMakeRotation(0);
        } completion:nil];
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMBtnClick" object:nil userInfo:nil]];
    }
    if (sender.tag == 91002) {
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        [self createbackView1Son1View:self.sframe];
    }
    if (sender.tag == 91003) {
        [self.backView1Son1View removeFromSuperview];
        [self.backView1Son2View removeFromSuperview];
        [self createbackView1Son2View:self.sframe];
    }
}
-(void)ppArrBtnClick:(UIButton *)sender{
    [self.ResultArr replaceObjectAtIndex:0 withObject:sender.titleLabel.text];
    
    [self.backView1 removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    [self.backView1Son1View removeFromSuperview];
    [self.backView1Son2View removeFromSuperview];
    
    [self.firstTable reloadData];
    UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
    UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
    UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
    btn1.selected = NO;
    btn2.selected = NO;
    btn3.selected = NO;
    [UIButton animateWithDuration:0.5 animations:^{
        btn1.imageView.transform = CGAffineTransformMakeRotation(0);
        btn2.imageView.transform = CGAffineTransformMakeRotation(0);
        btn3.imageView.transform = CGAffineTransformMakeRotation(0);
    } completion:nil];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMBtnClick" object:nil userInfo:nil]];
}
-(void)fgArrBtnClick:(UIButton *)sender{
    [self.ResultArr replaceObjectAtIndex:0 withObject:sender.titleLabel.text];
    
    [self.backView1 removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    [self.backView1Son1View removeFromSuperview];
    [self.backView1Son2View removeFromSuperview];
    
    [self.firstTable reloadData];
    UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
    UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
    UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
    btn1.selected = NO;
    btn2.selected = NO;
    btn3.selected = NO;
    [UIButton animateWithDuration:0.5 animations:^{
        btn1.imageView.transform = CGAffineTransformMakeRotation(0);
        btn2.imageView.transform = CGAffineTransformMakeRotation(0);
        btn3.imageView.transform = CGAffineTransformMakeRotation(0);
    } completion:nil];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMBtnClick" object:nil userInfo:nil]];
}
-(void)arr2BtnClick:(UIButton *)sender{
    [self.ResultArr replaceObjectAtIndex:1 withObject:sender.titleLabel.text];
    [self.ResultArr replaceObjectAtIndex:2 withObject:self.mainArr[2]];
    
    [self.backView1 removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    
    [self.firstTable reloadData];
    UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
    UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
    UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
    btn1.selected = NO;
    btn2.selected = NO;
    btn3.selected = NO;
    [UIButton animateWithDuration:0.5 animations:^{
        btn1.imageView.transform = CGAffineTransformMakeRotation(0);
        btn2.imageView.transform = CGAffineTransformMakeRotation(0);
        btn3.imageView.transform = CGAffineTransformMakeRotation(0);
    } completion:nil];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMBtnClick" object:nil userInfo:nil]];
}
-(void)arr3BtnClick:(UIButton *)sender{
    [self.ResultArr replaceObjectAtIndex:2 withObject:sender.titleLabel.text];
    [self.ResultArr replaceObjectAtIndex:1 withObject:self.mainArr[1]];
    
    [self.backView1 removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    
    [self.firstTable reloadData];
    UIButton *btn1 = (UIButton *)[self.firstTable viewWithTag:90001];
    UIButton *btn2 = (UIButton *)[self.firstTable viewWithTag:90002];
    UIButton *btn3 = (UIButton *)[self.firstTable viewWithTag:90003];
    btn1.selected = NO;
    btn2.selected = NO;
    btn3.selected = NO;
    [UIButton animateWithDuration:0.5 animations:^{
        btn1.imageView.transform = CGAffineTransformMakeRotation(0);
        btn2.imageView.transform = CGAffineTransformMakeRotation(0);
        btn3.imageView.transform = CGAffineTransformMakeRotation(0);
    } completion:nil];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"HUMBtnClick" object:nil userInfo:nil]];
}
-(NSMutableArray *)returnResultArr{
    return self.ResultArr;
}
-(void)dissmiss{
    [self.backView removeFromSuperview];
    [self.backView1 removeFromSuperview];
    [self.backView1Son1View removeFromSuperview];
    [self.backView1Son2View removeFromSuperview];
    [self.backView2 removeFromSuperview];
    [self.backView3 removeFromSuperview];
    [self.shadowView removeFromSuperview];
    [self.firstTable removeFromSuperview];
}
@end
