//
//  radarScanningView.m
//  iOS 雷达扫描扇形拼接
//
//  Created by Xinxibin on 16/7/25.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "RadarScanningView.h"

@implementation RadarScanningView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    
    _indicatorView = [[LRRadarIndicatorView alloc]initWithFrame:self.bounds];
    _indicatorView.backgroundColor = [UIColor clearColor];
    _indicatorView.radius = self.bounds.size.width / 2;
    [self addSubview:_indicatorView];
    
    [_indicatorView scan];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath * path1    = [UIBezierPath bezierPath];
    [path1 addArcWithCenter:self.center radius:rect.size.width/2 startAngle:0 endAngle:2* M_PI clockwise:true];
    
    UIBezierPath * path2    = [UIBezierPath bezierPathWithArcCenter:self.center radius:rect.size.width/2 - 50 startAngle:0 endAngle:2* M_PI clockwise:true];
    [path1 appendPath:path2];
    
    UIBezierPath * path3    = [UIBezierPath bezierPathWithArcCenter:self.center radius:rect.size.width/2 - 100 startAngle:0 endAngle:2* M_PI clockwise:true];
    [path1 appendPath:path3];
    
    UIBezierPath * path4    = [UIBezierPath bezierPathWithArcCenter:self.center radius:rect.size.width/2 - 150 startAngle:0 endAngle:2* M_PI clockwise:true];
    [path1 appendPath:path4];

    
    CAShapeLayer * shapeLayer   = [CAShapeLayer layer];
    shapeLayer.frame            = self.superview.bounds;
    shapeLayer.path             = path1.CGPath;
    shapeLayer.lineWidth        = 2;
    shapeLayer.strokeColor      = [UIColor greenColor].CGColor;
    shapeLayer.fillColor        = [UIColor clearColor].CGColor;
    shapeLayer.opacity          = 0.5;
    [self.layer addSublayer:shapeLayer];
    
}


@end
