//
//  HUMiooDropdownMenu.h
//  Tool
//
//  Created by 赵春生 on 2016/12/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUMiooDropdownMenu : UIView

@property (nonatomic,strong) NSMutableArray *ResultArr;
/**
 * 初始化HUM
 */
- (instancetype)initWithHUMiooframe:(CGRect)frame
                            mainArr:(NSMutableArray *)mainArr
                               arr1:(NSMutableArray *)arr1
                              ppArr:(NSMutableArray *)ppArr
                              fgArr:(NSMutableArray *)fgArr
                               arr2:(NSMutableArray *)arr2
                               arr3:(NSMutableArray *)arr3;
/**
 * 删除HUM
 * 建议放入导航栏返回按钮响应事件
 */
-(void)dissmiss;
-(NSMutableArray *)returnResultArr;
@end
