//
//  ViewController.swift
//  仿 爱奇艺 加载动画 swift
//
//  Created by Xinxibin on 16/7/12.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shapeLayer:CAShapeLayer?
    var shape:CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 仿爱奇艺加载loadingview动画
        let animationView = LoadingView(frame:CGRect(x: self.view.center.x - 16, y: self.view.center.y - 200, width: 32, height: 32))
        view.addSubview(animationView)

        // 自己写的仿
        setUI()
        setAnimationOne()
    }

    func setUI() {
        
        // 创建圆
        createRound()
        
        // 创建三角形
        let pathTriangle = UIBezierPath()
        let center = self.view.center
        let pointA = CGPointMake(center.x - 50, center.y + 30)
        let pointB = CGPointMake(center.x + 50, center.y + 30)
        
        pathTriangle.moveToPoint(CGPointMake(self.view.center.x, self.view.center.y - 50))
        pathTriangle.addLineToPoint(pointA)
        pathTriangle.addLineToPoint(pointB)
        pathTriangle.closePath()
        
        let shape = CAShapeLayer()
        shape.frame = self.view.bounds
        shape.path = pathTriangle.CGPath
        shape.lineWidth = 2
        // shape.strokeColor = UIColor(red: 0.52, green: 0.76, blue: 0.07, alpha: 1.00).CGColor
        shape.fillColor = UIColor(red: 0.52, green: 0.76, blue: 0.07, alpha: 1.00).CGColor
        self.view.layer.addSublayer(shape)
        
        self.shape = shape
        
        let viewc = ViewCAEmitter(frame: self.view.frame)
        self.view .addSubview(viewc)
        
    }
    
    /**
     创建一个圆形
     */
    func createRound() {
        let path = UIBezierPath(arcCenter: self.view.center, radius: 100, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame        = self.view.bounds
        shapeLayer.lineWidth    = 2
        shapeLayer.lineJoin     = kCALineJoinBevel
        shapeLayer.lineCap      = kCALineCapButt
        shapeLayer.strokeColor  = UIColor(red: 0.52, green: 0.76, blue: 0.07, alpha: 1.00).CGColor
        shapeLayer.fillColor    = UIColor.clearColor().CGColor
        shapeLayer.path         = path.CGPath
        self.view.layer.addSublayer(shapeLayer)
        shapeLayer.transform = CATransform3DRotate(shapeLayer.transform, CGFloat(-M_PI_2), 0, 0, 1)
        self.shapeLayer = shapeLayer

    }
    
    
    /**
     通过改变strokeStart 来实现动画
     */
    func setAnimationOne(){
        
        shapeLayer?.strokeStart  = 0
        shapeLayer?.strokeEnd    = 1
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.65
        animation.fromValue = 0
        animation.toValue = 1
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.setValue("BasicAnimationEnd", forKey: "animationName")
        shapeLayer?.addAnimation(animation, forKey: "BasicAnimationEnd")
    }
    
    func setAnimationTwo() {
        
        shapeLayer?.strokeStart = 1

        let animation2 = CABasicAnimation(keyPath: "strokeStart")
        animation2.duration = 0.65
        animation2.fromValue = 0
        animation2.toValue   = 1
        animation2.delegate = self
        animation2.removedOnCompletion = false
        animation2.fillMode = kCAFillModeForwards
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation2.setValue("BasicAnimationStart", forKey: "animationName")
        shapeLayer?.addAnimation(animation2, forKey: "BasicAnimationStart")
    }
    
    
    /**
     动画开始的回调方法
     
     - parameter anim: 执行动画的对象
     */
    override func animationDidStart(anim: CAAnimation) {
        
        if anim.valueForKey("animationName") as? String == "BasicAnimationEnd" {

            // 开始转三角
            shapeLayer?.strokeStart = 0
            
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.toValue = CGFloat(2 * M_PI)
            animation.duration = 0.65
            animation.delegate = self
            
            animation.setValue("BasicAnimationRotation", forKey: "animationName")
            
            self.shape?.addAnimation(animation, forKey: "BasicAnimationRotation")
            
        } else if(anim.valueForKey("animationName") as! String == "BasicAnimationStart")  {
            // 不转

        }
        
    }
    /**
     动画结束的回调方法
     
     - parameter anim: 执行动画的对象
     */
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        if(anim.valueForKey("animationName") as! String == "BasicAnimationEnd") {
            // 开始园消失的动画
            setAnimationTwo()

        }else if(anim.valueForKey("animationName") as! String == "BasicAnimationStart") {
            // 当园消失动画完成后，清楚所有动画 从新开始画圆动画
            shapeLayer?.removeAllAnimations()
            shapeLayer?.removeFromSuperlayer()
            createRound()
            setAnimationOne()
        }
        
    }
    
}






