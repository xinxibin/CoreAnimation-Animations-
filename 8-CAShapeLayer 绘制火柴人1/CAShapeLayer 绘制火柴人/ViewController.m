//
//  ViewController.m
//  CAShapeLayer 绘制火柴人
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic) CAShapeLayer * layer1;
@property (nonatomic) CAShapeLayer * layer2;
@property (nonatomic) CAShapeLayer * layer3;
@property (nonatomic) CAShapeLayer * layer4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(delay1) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(delay2) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(delay3) userInfo:nil repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(delay4) userInfo:nil repeats:true];

    [self layerAnimation1];
    [self layerAnimation2];
    [self layerAnimation3];
    [self layerAnimation4];

}
// 浮点 随机数 drand48()
- (void)delay1 {
    [self.layer1 removeAllAnimations];
    
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration  = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    [self.layer1 addAnimation:pathAnimation forKey:nil];
    
}
- (void)delay2 {
    [self.layer2 removeAllAnimations];

    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration  = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    [self.layer2 addAnimation:pathAnimation forKey:nil];
    
}
- (void)delay3 {
    
    [self.layer3 removeAllAnimations];

    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration  = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    [self.layer3 addAnimation:pathAnimation forKey:nil];
    
}
- (void)delay4 {
    [self.layer4 removeAllAnimations];

    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration  = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    [self.layer4 addAnimation:pathAnimation forKey:nil];
    
}

- (void)layerAnimation1 {
    UIBezierPath * path = [[UIBezierPath alloc]init];
    // 圆圈
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:2*M_PI endAngle:0 clockwise:false];
    
    self.layer1 = [CAShapeLayer layer];
    self.layer1.strokeColor   = [UIColor redColor].CGColor;
    self.layer1.fillColor     = [UIColor clearColor].CGColor;
    self.layer1.lineWidth     = 5;                   // 线宽，用点表示单位
    // 线条之间的结合点的样子 三种类型 kCALineJoinRound、kCALineJoinMiter 、kCALineJoinBevel
    self.layer1.lineJoin      = kCALineJoinRound;
    self.layer1.lineCap       = kCALineCapRound;     // 线条结尾的样子 kCALineCapButt 、 kCALineCapSquare
    self.layer1.path          = path.CGPath;         //
    self.layer1.speed         = 0.5f;                 // 绘制速率（速度）
//    self.layer1.strokeStart   = 0.50f;                // 初始化的时候设置 意思为 初始的位置
//    self.layer1.strokeEnd     = 0.500001f;
    [self.containerView.layer addSublayer:self.layer1];

}

- (void)layerAnimation2 {
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    // 竖折
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];

    self.layer2 = [CAShapeLayer layer];
    self.layer2.strokeColor   = [UIColor redColor].CGColor;
    self.layer2.fillColor     = [UIColor clearColor].CGColor;
    self.layer2.lineWidth     = 5;                   // 线宽，用点表示单位
    self.layer2.lineJoin      = kCALineJoinRound;    // 线条之间的结合点的样子
    self.layer2.lineCap       = kCALineCapRound;     // 线条结尾的样子
    self.layer2.path          = path.CGPath;         //
    self.layer2.speed         = 0.5f;                 // 绘制速率（速度）
    // self.layer.strokeStart   = 0.0f;                // 初始化的时候设置 意思为 初始的位置
    // self.layer.strokeEnd     = 0.000001f;
    [self.containerView.layer addSublayer:self.layer2];

}

- (void)layerAnimation3 {
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    // Nan
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];

    self.layer3 = [CAShapeLayer layer];
    self.layer3.strokeColor   = [UIColor redColor].CGColor;
    self.layer3.fillColor     = [UIColor clearColor].CGColor;
    self.layer3.lineWidth     = 5;                   // 线宽，用点表示单位
    self.layer3.lineJoin      = kCALineJoinRound;    // 线条之间的结合点的样子
    self.layer3.lineCap       = kCALineCapRound;     // 线条结尾的样子
    self.layer3.path          = path.CGPath;         //
    self.layer3.speed         = 0.5f;                 // 绘制速率（速度）
    // self.layer.strokeStart   = 0.0f;                // 初始化的时候设置 意思为 初始的位置
    // self.layer.strokeEnd     = 0.000001f;
    [self.containerView.layer addSublayer:self.layer3];

}

- (void)layerAnimation4 {
 
    UIBezierPath * path = [[UIBezierPath alloc]init];
    // 橫
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];

    self.layer4 = [CAShapeLayer layer];
    self.layer4.strokeColor   = [UIColor redColor].CGColor;
    self.layer4.fillColor     = [UIColor clearColor].CGColor;
    self.layer4.lineWidth     = 5;                   // 线宽，用点表示单位
    self.layer4.lineJoin      = kCALineJoinRound;    // 线条之间的结合点的样子
    self.layer4.lineCap       = kCALineCapRound;     // 线条结尾的样子
    self.layer4.path          = path.CGPath;         //
    self.layer4.speed         = 0.5f;                 // 绘制速率（速度）
    // self.layer.strokeStart   = 0.0f;                // 初始化的时候设置 意思为 初始的位置
    // self.layer.strokeEnd     = 0.000001f;
    [self.containerView.layer addSublayer:self.layer4];

}
@end











