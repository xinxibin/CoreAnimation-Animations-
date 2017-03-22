//
//  LoadingView.swift
//  仿 爱奇艺 加载动画 swift
//
//  Created by Xinxibin on 16/7/12.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var NSTimeInterval:Double = 0.65
    var maskLayer:CAShapeLayer!
    
    lazy var conterImageView:TriangleView = {
        var conterImageView = TriangleView(frame: CGRectMake(0,0, self.bounds.size.width*0.5, self.bounds.size.width*0.5))
        conterImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2 - 32)
        conterImageView.backgroundColor = UIColor.clearColor()
        return conterImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp()
    {
        //因为没有找到合适的图，我自己画了一个等边三角形，其实这个可以让美工做一个图，你把imageView放到中间即可
        self.addSubview(conterImageView)
        drawRound()
        animationOne()
        
    }
    
    func drawRound() {
        //画一个圆
        let path = UIBezierPath(ovalInRect: self.bounds)
        maskLayer = CAShapeLayer()
        maskLayer.fillColor=UIColor.clearColor().CGColor
        //将路径赋值给CAShapeLayer
        maskLayer.path=path.CGPath;
        //设置路径的颜色
        maskLayer.strokeColor=UIColor(red: 0.52, green: 0.76, blue: 0.07, alpha: 1.00).CGColor
        //设置路径的宽度
        maskLayer.lineWidth=1;
        maskLayer.lineCap=kCALineCapButt
        
        self.layer.addSublayer(maskLayer)
        maskLayer.transform=CATransform3DRotate(maskLayer.transform, CGFloat(-M_PI_2), 0, 0, 1)
        
    }
    
    func animationOne() {
        maskLayer?.strokeStart  = 0;
        maskLayer?.strokeEnd    = 1.0
        
        let BasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        BasicAnimation.fromValue = 0
        BasicAnimation.duration=NSTimeInterval
        BasicAnimation.delegate=self
        BasicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        BasicAnimation.setValue("BasicAnimationEnd", forKey: "animationName")
        maskLayer?.addAnimation(BasicAnimation, forKey:"BasicAnimationEnd")
        
    }
    func animationTwo() {
        
        maskLayer?.strokeStart=1.0
        let BasicAnimation = CABasicAnimation(keyPath: "strokeStart")
        BasicAnimation.fromValue=0
        BasicAnimation.duration=NSTimeInterval
        BasicAnimation.delegate=self
        BasicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        BasicAnimation.setValue("BasicAnimationStart", forKey: "animationName")
        maskLayer?.addAnimation(BasicAnimation, forKey:"BasicAnimationStart")
        
        
    }    
    
}

extension LoadingView
{
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        
        if(anim.valueForKey("animationName") as! String == "BasicAnimationEnd")
        {
            //当画圆的动画完成后同时开始三角形旋转和开始圆消失的动画
            //
            //开始圆消失的动画
            animationTwo()
        }
        else if(anim.valueForKey("animationName") as! String == "BasicAnimationStart")
        {
            //当圆消失动画完成后，清除所有动画从新开始画圆动画
            self.maskLayer?.removeAllAnimations()
            self.maskLayer?.removeFromSuperlayer()
            drawRound()
            animationOne()
        }
        
        
    }
    
    override func animationDidStart(anim: CAAnimation) {
        
        if anim.valueForKey("animationName") as? String == "BasicAnimationEnd" {
            
            // 开始转三角
            //开始三角形旋转
            let BasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            BasicAnimation.toValue=CGFloat(2*M_PI)
            BasicAnimation.duration=NSTimeInterval
            BasicAnimation.delegate=self
            
            BasicAnimation.setValue("BasicAnimationRotation", forKey: "animationName")
            conterImageView.layer.addAnimation(BasicAnimation, forKey:"BasicAnimationRotation")
            
        } else {
            // 不转
            
        }
        
    }
}

