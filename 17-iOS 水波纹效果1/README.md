# iOS-CALayerAnimation11

### 所需知识

* CALayer
* CAKeyframeAnimation
* CAAnimationGroup

### 实现原理
```objc

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    NSInteger pulsingCount = 5;
    double animationDuration = 3;
    
    CALayer * animationLayer = [CALayer layer];
    
    for (int i = 0; i < pulsingCount; i++) {
        CALayer * pulsingLayer = [CALayer layer];
        pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulsingLayer.borderColor = [UIColor whiteColor].CGColor;
        pulsingLayer.borderWidth = 2;
        pulsingLayer.cornerRadius = rect.size.height / 2;
        
        CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
        // 修改这两个值来达到 扩散 还是 回收 记得修改 透明度（ opacityAnima ） 要不会 一闪一闪
        // 初始大小
        scaleAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 0.0)];
        // 结束大小 （ 等比放大多少倍 ）
        scaleAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 2, 2, 0.0)];
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        animationGroup.animations = @[opacityAnimation,scaleAnima];
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
        
        [animationLayer addSublayer:pulsingLayer];
    }
    [self.layer addSublayer:animationLayer];
}

```

![](http://oahmyhzk1.bkt.clouddn.com/image/gif/Water%20ripple.gif)