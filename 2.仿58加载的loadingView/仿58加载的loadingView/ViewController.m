//
//  ViewController.m
//  仿58加载的loadingView
//
//  Created by Xinxibin on 16/7/11.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong,nonatomic) CAShapeLayer * shapeLayer;
@property (nonatomic) UIBezierPath * path;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI1];
    [self startAnimation];
    
    
    [self setUI2];
}

- (void)setUI1 {
    
    self.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50)
                                                         radius:50
                                                     startAngle:0
                                                       endAngle:M_PI * 2
                                                      clockwise:false];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = _layerView.bounds;
    _shapeLayer.path = self.path.CGPath;
    _shapeLayer.lineWidth = 4;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    _shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    _shapeLayer.speed       = 0.5;
    [self.layerView.layer addSublayer:_shapeLayer];
    
}


- (void)startAnimation {
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue   = [NSNumber numberWithFloat:1.0f];
    animation.duration  = 1.0;
    [_shapeLayer addAnimation:animation forKey:@""];
}


// 动画二
- (void)setUI2 {
    
    LoadingView * loadingView = [[LoadingView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    loadingView.center = self.view.center;
    loadingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loadingView];
    
    [loadingView startAnimation];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
