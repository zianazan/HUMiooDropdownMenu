//
//  HUMiooFirstTableViewCell.m
//  Tool
//
//  Created by 赵春生 on 2016/12/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//
#define HUMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HUMgrayTintColor HUMColor(219, 219, 219)
#define HUMwindow_w ([UIScreen mainScreen].bounds.size.width)

#import "HUMiooFirstTableViewCell.h"
@interface HUMiooFirstTableViewCell ()
@end
@implementation HUMiooFirstTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        for (int i = 1; i<3; i++) {
            UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(HUMwindow_w/3*i, 5, 1, 30)];
            separatorView.backgroundColor = HUMgrayTintColor;
            [self addSubview:separatorView];
        }
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HUMwindow_w/3, 39)];
        btn1.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn1.userInteractionEnabled = YES;
        btn1.tag = 90001;
        [btn1 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_normal"] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_Selected"] forState:UIControlStateSelected];

        [btn1 layoutIfNeeded];
        btn1.imageEdgeInsets = UIEdgeInsetsMake(10, HUMwindow_w/3 - 10, 10, 20);
        [self addSubview:btn1];
        self.Btn1 = btn1;
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(HUMwindow_w/3, 0, HUMwindow_w/3, 39)];
        btn2.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn2.userInteractionEnabled = YES;
        btn2.tag = 90002;
        [btn2 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_normal"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_Selected"] forState:UIControlStateSelected];
        [btn2 layoutIfNeeded];
        btn2.imageEdgeInsets = UIEdgeInsetsMake(10, HUMwindow_w/3 - 10, 10, 20);
        [self addSubview:btn2];
        self.Btn2 = btn2;
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(HUMwindow_w/3*2, 0, HUMwindow_w/3, 39)];
        btn3.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn3.userInteractionEnabled = YES;
        btn3.tag = 90003;
        [btn3 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_normal"] forState:UIControlStateNormal];
        [btn3 setImage:[UIImage imageNamed:@"HUMSmallTriangle_btn_Selected"] forState:UIControlStateSelected];
        [btn3 layoutIfNeeded];
        btn3.imageEdgeInsets = UIEdgeInsetsMake(10, HUMwindow_w/3 - 10, 10, 20);
        [self addSubview:btn3];
        self.Btn3 = btn3;
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, HUMwindow_w, 1)];
        separatorView.backgroundColor = HUMgrayTintColor;
        [self addSubview:separatorView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
