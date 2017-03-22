//
//  LoadingView.m
//  仿58加载的loadingView
//
//  Created by Xinxibin on 16/7/11.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "LoadingView.h"


@implementation LoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.viewCenterPoint = self.center;
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.viewCenterPoint = self.center;
        [self setUI];
    }
    return  self;
}

- (void)setUI {
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:self.viewCenterPoint radius:50 startAngle:0 endAngle:2 * M_PI clockwise:true];
    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = self.layer.bounds;
    _shapeLayer.path = path.CGPath;
    _shapeLayer.lineWidth = 4;
    _shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    _shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    _shapeLayer.lineCap       = kCALineCapButt;
    _shapeLayer.speed         = 0.5f;
    
    [self.layer addSublayer:_shapeLayer];
    
    
}

- (void)startAnimation {
    
    _shapeLayer.strokeStart  = 0;
    _shapeLayer.strokeEnd  = 1;
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation1.duration = 0.5f;
    animation1.fromValue = [NSNumber numberWithFloat:0.0f];
    animation1.delegate  = self;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [animation1 setValue:@"BasicAnimationEnd" forKey:@"animationName"];
    [_shapeLayer addAnimation:animation1 forKey:@"BasicAnimationEnd"];
    
}

- (void)delayOne {

    _shapeLayer.strokeStart  = 1;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation2.duration = 0.5f;
    animation2.fromValue = [NSNumber numberWithFloat:0.0f];
    animation2.delegate  = self;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [animation2 setValue:@"BasicAnimationStart" forKey:@"animationName"];
    [_shapeLayer addAnimation:animation2 forKey:@"BasicAnimationStart"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"BasicAnimationEnd"]) {
        // 重新开始动画
        [self performSelector:@selector(delayOne) withObject:nil afterDelay:0.4];
    }
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"BasicAnimationEnd"]) {
        // 开始 回收动画
        NSLog(@" animationDidStop --- %@",[anim valueForKey:@"animationName"]);
//        [self delayOne];
    } else if ([[anim valueForKey:@"animationName"] isEqualToString:@"BasicAnimationStart"]) {
        // 回收动画结束
        [self.shapeLayer removeAllAnimations];
        [self.shapeLayer removeFromSuperlayer];
        [self setUI];
        [self startAnimation];
    }
}

@end
