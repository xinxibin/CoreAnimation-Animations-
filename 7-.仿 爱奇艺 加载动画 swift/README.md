# iOS-CALayerAnimation7


* 模仿爱奇艺加载动画
* 实现原理使用 UIBezierPath、CABasicAnimation
* 以及两个回调方法 ：

```objc
    public func animationDidStart(anim: CAAnimation)
    
    public func animationDidStop(anim: CAAnimation, finished flag: Bool)

```

* 实用方法简单 

```objc

    let animationView = LoadingView(frame:CGRect(x: self.view.center.x - 16, y: self.view.center.y - 200, width: 32, height: 32))
    view.addSubview(animationView)

```

![](http://oahmyhzk1.bkt.clouddn.com/image/gif/imitationIqiyiLoadingAnimation.gif)

