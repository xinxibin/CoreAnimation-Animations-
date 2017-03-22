# Swift-CAGradientLayer
最近对iOS 动画非常感兴趣，研究渐变圆的实现，在网上找了很多，看了看，没有直接实现的，找到一个最简单的实现方法，图层拼接,下面带大家先了解一下 CAGradientLayer .

* 属性不多易懂
CAGradientLayer 坐标系
![](http://images.cnitblog.com/i/607542/201406/180835350983550.png)


<!--more-->

![](http://images.cnitblog.com/i/607542/201406/180836284895260.png)


```objc
    
    func createUI1() {
        let gradientLayer           = CAGradientLayer()
        gradientLayer.frame         = self.gradientView.bounds
        self.gradientView.layer.addSublayer(gradientLayer)
        
        // 颜色分配
        gradientLayer.colors        = [UIColor.blackColor().CGColor,UIColor.whiteColor().CGColor]
        
        // 颜色分割线位置( 默认 0，1 )
        gradientLayer.locations     = [0,1]
        
        // 起始点 坐标是 左上 （0，0）  右下 （1，1）
        gradientLayer.startPoint    = CGPointMake(0, 0)
        
        // 结束点
        gradientLayer.endPoint      = CGPointMake(1, 0)
    }
    
    func createUI2() {

        let gradientLayer           = CAGradientLayer()
        gradientLayer.frame         = self.gradientView2.bounds
        self.gradientView2.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors        = [UIColor.redColor().CGColor,UIColor.greenColor().CGColor,UIColor.blueColor().CGColor]

        gradientLayer.locations     = [0.25,0.5,0.75]
        
        gradientLayer.startPoint    = CGPointMake(0, 0.5)
        
        gradientLayer.endPoint      = CGPointMake(1, 0.5)

    }

```

* [实战使用](https://xinxibin.com/iOS-Gradient-Circle-LoadingView#more)

* [项目地址](https://github.com/xinxibin/Swift-CAGradientLayer)

* [简书地址](http://www.jianshu.com/p/ac603687bd50)