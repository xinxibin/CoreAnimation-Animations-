//
//  ViewController.m
//  4.UIBezierPath
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化方法 创建圆形 或者椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(260, 20, 100, 100)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _layerView.bounds;
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.strokeStart = 0.5;
    shapeLayer.strokeEnd   = 0.5;
    [_layerView.layer addSublayer:shapeLayer];
    
    
    CABasicAnimation *pathAnima1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    pathAnima1.duration = 3.0f;
    pathAnima1.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnima1.toValue = [NSNumber numberWithFloat:0.0f];
    
    CABasicAnimation *pathAnima2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima2.duration = 3.0f;
    pathAnima2.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnima2.toValue = [NSNumber numberWithFloat:1.0f];
    
    [shapeLayer addAnimation:pathAnima1 forKey:@""];
    [shapeLayer addAnimation:pathAnima2 forKey:@""];
    
    // 加上这两句 让动画结束 路径不消失
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd   = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
