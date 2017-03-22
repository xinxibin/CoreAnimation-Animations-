//
//  ViewController.m
//  BezierPath
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) CAShapeLayer *topEyesocketLayer;
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CAShapeLayer *bottomEyesocketLayer;
@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeballLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.layerView.layer addSublayer:[self topEyesocketLayer]];    // 上线
    [self.layerView.layer addSublayer:self.eyeFirstLightLayer];     // 长点
    [self.layerView.layer addSublayer:self.eyeSecondLightLayer];    // 短点
    [self.layerView.layer addSublayer:self.eyeballLayer];           // 内园
    [self.layerView.layer addSublayer:[self bottomEyesocketLayer]]; // 下线

    [self start];
}
- (IBAction)onBlackBtnClick:(id)sender {
    [self start];
}

- (void) start {
    [self startAnimationWithObj:_topEyesocketLayer];
    [self startAnimationWithObj:_eyeFirstLightLayer];
    [self startAnimationWithObj:_eyeSecondLightLayer];
    [self startAnimationWithObj:_eyeballLayer];
    [self startAnimationWithObj:_bottomEyesocketLayer];

}

- (void)startAnimationWithObj:(CAShapeLayer*)layer {
    
    layer.strokeStart       = 0.5;
    layer.strokeEnd         = 0.5;
    
    CGFloat fromvalue   = 0.5;
    CGFloat toValue1     = 0;
    CGFloat toValue2     = 1;
    
    if (layer == _eyeballLayer) {
        layer.strokeStart       = 0.75;
        layer.strokeEnd         = 0.75;
        fromvalue               = 0.75;
    }
    
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    pathAnimation.duration  = 3.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:fromvalue];
    pathAnimation.toValue   = [NSNumber numberWithFloat:toValue1];
    [layer addAnimation:pathAnimation forKey:nil];

    CABasicAnimation * pathAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation2.duration  = 3.0;
    pathAnimation2.fromValue = [NSNumber numberWithFloat:fromvalue];
    pathAnimation2.toValue   = [NSNumber numberWithFloat:toValue2];
    [layer addAnimation:pathAnimation2 forKey:nil];

    
    layer.strokeStart       = 0.0f;
    layer.strokeEnd         = 1.0f;

}

- (CAShapeLayer *)eyeFirstLightLayer {
    if (!_eyeFirstLightLayer) {
        _eyeFirstLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, CGRectGetHeight(self.layerView.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.layerView.frame) * 0.2
                                                        startAngle:(230.f / 180.f) * M_PI
                                                          endAngle:(265.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeFirstLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeFirstLightLayer.lineWidth = 5.f;
        _eyeFirstLightLayer.path = path.CGPath;
        _eyeFirstLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeFirstLightLayer;
}

- (CAShapeLayer *)eyeSecondLightLayer {
    if (!_eyeSecondLightLayer) {
        _eyeSecondLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, CGRectGetHeight(self.layerView.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.layerView.frame) * 0.2
                                                        startAngle:(211.f / 180.f) * M_PI
                                                          endAngle:(220.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeSecondLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeSecondLightLayer.lineWidth = 5.f;
        _eyeSecondLightLayer.path = path.CGPath;
        _eyeSecondLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeSecondLightLayer.strokeColor = [UIColor whiteColor].CGColor;
        
    }
    return _eyeSecondLightLayer;
}

- (CAShapeLayer *)eyeballLayer {
    if (!_eyeballLayer) {
        _eyeballLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, CGRectGetHeight(self.layerView.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:CGRectGetWidth(self.layerView.frame) * 0.3
                                                        startAngle:(0.f / 180.f) * M_PI
                                                          endAngle:(360.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeballLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeballLayer.lineWidth = 1.f;
        _eyeballLayer.path = path.CGPath;
        _eyeballLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeballLayer.strokeColor = [UIColor whiteColor].CGColor;
        _eyeballLayer.anchorPoint = CGPointMake(0.5, 0.5);
        
    }
    return _eyeballLayer;
}

- (CAShapeLayer *)topEyesocketLayer {
    if (!_topEyesocketLayer) {
        _topEyesocketLayer = [CAShapeLayer layer];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGPoint center = CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, CGRectGetHeight(self.layerView.frame) / 2);
        [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.layerView.frame) / 2)];
        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.layerView.frame), CGRectGetHeight(self.layerView.frame) / 2)
                     controlPoint:CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, center.y - center.y - 20)];
        
        _topEyesocketLayer.strokeStart  = 0.5;
        _topEyesocketLayer.strokeEnd    = 0.5;

        _topEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _topEyesocketLayer.lineWidth = 1.f;
        _topEyesocketLayer.path = path.CGPath;
        _topEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _topEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;

    }
    return _topEyesocketLayer;
}
- (CAShapeLayer *)bottomEyesocketLayer {
    if (!_bottomEyesocketLayer) {
        _bottomEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, CGRectGetHeight(self.layerView.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.layerView.frame) / 2)];
        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.layerView.frame), CGRectGetHeight(self.layerView.frame) / 2)
                     controlPoint:CGPointMake(CGRectGetWidth(self.layerView.frame) / 2, center.y + center.y + 20)];
        _bottomEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _bottomEyesocketLayer.lineWidth = 1.f;
        _bottomEyesocketLayer.path = path.CGPath;
        _bottomEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
        
    }
    return _bottomEyesocketLayer;
}


@end
