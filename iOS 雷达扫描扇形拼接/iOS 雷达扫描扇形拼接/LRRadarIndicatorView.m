//
//  XHRadarIndicatorView.m
//  XHRadarView
//
//  Created by 邱星豪 on 14/10/27.
//  Copyright (c) 2014年 邱星豪. All rights reserved.
//

#import "LRRadarIndicatorView.h"
#import <QuartzCore/QuartzCore.h>

#define RADAR_ROTATE_SPEED 150.0f // 默认转速
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)  // 角度转换弧度

@implementation LRRadarIndicatorView

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    // 一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context    = UIGraphicsGetCurrentContext();
    // 画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    UIColor *aColor         = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 0);//线的宽度
    //以self.radius为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, self.center.x, self.center.y);
    // 绘制一条弧度会0.5的扇形
    CGContextAddArc(context, self.center.x, self.center.y, self.radius, DEGREES_TO_RADIANS(-90.5), DEGREES_TO_RADIANS(-90), 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    
    //多个小扇形构造渐变的大扇形  直角扇形
    for (int i = 0; i<=90; i++) {
        //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
        UIColor *aColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:i/500.0f];
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 0);//线的宽度
        //以self.radius为半径围绕圆心画指定角度扇形
        CGContextMoveToPoint(context, self.center.x, self.center.y);
        CGContextAddArc(context, self.center.x, self.center.y, self.radius,  (-180 + i) * M_PI / 180, (-180 + i - 1) * M_PI / 180, 1);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    }
}

//转动
#pragma mark - Actions
- (void)scan {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 360.f/(_isCustomSpeed ? self.radarSpeed : RADAR_ROTATE_SPEED);
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INT_MAX;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stop {
    [self.layer removeAnimationForKey:@"rotationAnimation"];
}



@end
