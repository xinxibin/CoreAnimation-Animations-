//
//  ViewController.m
//  动画练习-OC-1
//
//  Created by Xinxibin on 16/7/6.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic) CAShapeLayer * layer;
@property (strong,nonatomic) UIView * showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:_showView];
    
    _showView.backgroundColor = [UIColor redColor];
    _showView.alpha = 0.5;
    
    // 创建一个贝塞尔曲线 创建一个圆
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50.0f, 50.0f) radius:50.0f startAngle:0 endAngle:M_PI* 3 clockwise:true];
    
    // 创建一个shapeLayer
    _layer = [CAShapeLayer layer];
    _layer.frame         = _showView.bounds;
    _layer.strokeColor   = [UIColor greenColor].CGColor; // 边缘线的颜色
    _layer.fillColor     = [UIColor clearColor].CGColor; // 闭环填充的颜色
    _layer.lineCap       = kCALineCapSquare;             // 边缘线的类型
    _layer.path          = path.CGPath;                  // 从贝塞尔曲线获取到形状
    _layer.lineWidth     = 4.0f;
    _layer.strokeStart   = 0.0f;
    _layer.strokeEnd     = 0.1f;
    
    
    // 将layer添加进图层
    [_showView.layer addSublayer:_layer];
    
    // 3s后执行动画操作 直接赋值就能产生动画效果
    [self performSelector:@selector(delay) withObject:nil afterDelay:3];
    
}

- (void)delay {
    
    _layer.speed        = 0.7;
    _layer.strokeStart  = 0.5;
    _layer.strokeEnd    = 1.0;
    _layer.lineWidth    = 1.0f;
    
    
    // 给这个layer 添加动画效果
    
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration  = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    [_layer addAnimation:pathAnimation forKey:nil];
    
}


@end







