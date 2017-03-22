//
//  UIBezierPathView.m
//  4.UIBezierPath
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "UIBezierPathView.h"
// 弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
// 角度转弧度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation UIBezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

// UIBezierPath 绘制图形
    
    // 绘制矩形实心
    [[UIColor yellowColor]setFill];
    UIRectFill(CGRectMake(140, 20, 100, 100));
    
    // 绘制一个长方形 空心
    UIColor * color = [UIColor blueColor];
    [color set];
    UIBezierPath * path1 = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 100)];
    path1.lineWidth = 4;
    path1.lineJoinStyle = kCGLineJoinRound;
    path1.lineCapStyle =  kCGLineCapRound;
    [path1 stroke];

    
    // 绘制一段弧线
    UIBezierPath * path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(70, 190)
                                                          radius:50
                                                      startAngle:0
                                                        endAngle:DEGREES_TO_RADIANS(135)
                                                       clockwise:true];
    [[UIColor redColor]set];
    path2.lineWidth = 4.0;
    path2.lineCapStyle = kCGLineCapRound; //线条拐角
    path2.lineJoinStyle = kCGLineJoinRound; //终点处理

    [path2 stroke];
    
    
    // 绘制曲线 - 1   二次贝塞尔曲线
    UIBezierPath * path3 = [UIBezierPath bezierPath];
    path3.lineWidth = 4;
    path3.lineCapStyle  = kCGLineCapRound;
    path3.lineJoinStyle = kCGLineJoinRound;
    // 起点
    [path3 moveToPoint:CGPointMake(140, 240)];
    // toPoint：终点坐标  controlPoint： 弧度点
    [path3 addQuadCurveToPoint:CGPointMake(240, 240) controlPoint:CGPointMake(190, 150)];
    [path3 stroke];
    
    // 绘制曲线 - 2  三次贝塞尔曲线
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [[UIColor blueColor] set];
    path4.lineWidth = 4;
    path4.lineCapStyle = kCGLineCapRound;
    path4.lineJoinStyle = kCGLineJoinRound;
    [path4 moveToPoint:CGPointMake(250, 250)];
    [path4 addCurveToPoint:CGPointMake(350, 200)
             controlPoint1:CGPointMake(340, 40)
             controlPoint2:CGPointMake(280, 430)];
    [path4 stroke];
    
    
// 使用 CAShapeLayer 层 实现图像
    
    // 画一个实心长方形
    CAShapeLayer *  layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(20, 260, 100, 80);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:layer];
    
    // 画一个空心长方形
    UIBezierPath * path5 = [UIBezierPath bezierPathWithRect:CGRectMake(140, 260, 100, 80)];
    CAShapeLayer * layer5 = [CAShapeLayer layer];
    layer5.path = path5.CGPath;
    layer5.fillColor = [UIColor clearColor].CGColor; // 清楚填充颜色
    layer5.strokeColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:layer5];
    
    // 画一个椭圆
    UIBezierPath * path6 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(260, 270, 100, 60) cornerRadius:30];
    CAShapeLayer * layer6 = [CAShapeLayer layer];
    layer6.path = path6.CGPath;
    layer6.fillColor = [UIColor clearColor].CGColor;
    layer6.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer6];
    
    // 画一个园
    CGFloat radius      = 60.0;
    CGFloat startAngle  = 0.0;
    CGFloat endAngle    = M_PI * 2;
    
    UIBezierPath * path7 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(70, 410) radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
    CAShapeLayer * layer7 = [CAShapeLayer layer];
    layer7.lineWidth = 4;
    layer7.path = path7.CGPath;
    layer7.fillColor = [UIColor clearColor].CGColor;
    layer7.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer7];
    
    
}


@end









