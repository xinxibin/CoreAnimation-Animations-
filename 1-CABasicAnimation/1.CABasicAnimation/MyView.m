//
//  MyView.m
//  1.CABasicAnimation
//
//  Created by Xinxibin on 16/7/8.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //创建带圆角的矩形  圆角半径：20
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(60, 100, 200, 200) cornerRadius:20];
    
    //创建可以指定圆角位置的矩形
    //第一个参数一样是传了个矩形
    //第二个参数是指定在哪个方向画圆角
    //第三个参数是一个CGSize类型，用来指定水平和垂直方向的半径的大小
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(60, 100, 200, 200) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(100, 50)];
    
    //配置属性
    [[UIColor yellowColor] setFill];    //设置填充颜色
    [[UIColor redColor] setStroke];     //设置描边颜色
    
    path.lineWidth = 3;     //设置线宽
    
    //渲染
    [path stroke];
    [path fill];

    
}


@end
