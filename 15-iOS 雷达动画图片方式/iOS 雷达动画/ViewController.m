//
//  ViewController.m
//  iOS 雷达动画
//
//  Created by Xinxibin on 16/7/22.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CAShapeLayer * shapeLineLayer;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageView.center = CGPointMake(self.view.center.x , self.view.center.y + 175 + 100);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

    [self setUI];
    [self startImageView];
}

- (void)startImageView {
    
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 5;
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    animation.repeatCount = HUGE;
    animation.cumulative = true;
    
    [self.imageView.layer addAnimation:animation forKey:@"rotationAnimation"];
    
}

- (void)setUI {
    
    // 绘制四个圆圈
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.view.center radius:25 startAngle:0 endAngle:2 * M_PI clockwise:true];
    
    UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 addArcWithCenter:self.view.center radius:75 startAngle:0 endAngle:2 * M_PI clockwise:true];
    [path appendPath:path2];
    
    UIBezierPath * path3 = [UIBezierPath bezierPath];
    [path3 addArcWithCenter:self.view.center radius:125 startAngle:0 endAngle:2 * M_PI clockwise:true];
    [path appendPath:path3];
    
    UIBezierPath * path4 = [UIBezierPath bezierPath];
    [path4 addArcWithCenter:self.view.center radius:175 startAngle:0 endAngle:2 * M_PI clockwise:true];
    [path appendPath:path4];
    
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    shapeLayer.opacity = 0.5;
    [self.view.layer addSublayer:shapeLayer];
    
    // 绘制一条线
    UIBezierPath * linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(12.5, self.view.center.y)];
    [linePath addLineToPoint:CGPointMake(self.view.center.x, self.view.center.y)];
    
    self.shapeLineLayer = [CAShapeLayer layer];
    self.shapeLineLayer.frame = self.view.bounds;
    self.shapeLineLayer.lineWidth = 1;
    self.shapeLineLayer.path = linePath.CGPath;
    self.shapeLineLayer.strokeColor = [UIColor redColor].CGColor;

    [self.view.layer addSublayer:self.shapeLineLayer];
    
    
    [self startAnimationLine];
    
}

- (void)startAnimationLine {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue   = [NSNumber numberWithFloat:2 * M_PI];
    
    CAAnimationGroup * groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 5;
    groupAnimation.repeatCount = HUGE;
    groupAnimation.animations = @[animation];
    
    [self.shapeLineLayer addAnimation:groupAnimation forKey:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
