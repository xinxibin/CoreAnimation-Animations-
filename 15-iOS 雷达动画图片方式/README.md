# iOS-CALayerAnimation12



```objc
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 5;
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    animation.repeatCount = HUGE;
    animation.cumulative = true;
    
    [self.imageView.layer addAnimation:animation forKey:@"rotationAnimation"];
```

![](http://oahmyhzk1.bkt.clouddn.com/image/gif/Radar%20animation.gif)

* 扇形拼接方法 
[点这里](https://github.com/xinxibin/iOS-CALayerAnimation13)