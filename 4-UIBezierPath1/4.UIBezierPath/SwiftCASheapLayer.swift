//
//  SwiftCASheapLayer.swift
//  4.UIBezierPath
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class SwiftCASheapLayer: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let startPoint = CGPointMake(50, 100)
        let endPoint = CGPointMake(100, 100)
        let controlPoint = CGPointMake(75, 50)
        
        let layer1 = CALayer()
        layer1.frame = CGRectMake(startPoint.x - 5/2, startPoint.y, 5, 5)
        layer1.backgroundColor = UIColor.redColor().CGColor
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x - 5/2, endPoint.y, 5, 5)
        layer2.backgroundColor = UIColor.yellowColor().CGColor
        
        let layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x - 5/2, controlPoint.y, 5, 5)
        layer3.backgroundColor = UIColor.blueColor().CGColor
        
        // 二次贝塞尔曲线
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        path.moveToPoint(startPoint)
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        
        self.layer.addSublayer(layer)
        self.layer.addSublayer(layer1)
        self.layer.addSublayer(layer2)
        self.layer.addSublayer(layer3)
        
        
        
        
    }
//    private func animation1() {
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.duration = 2
//        layer.addAnimation(animation, forKey: "")
//    }
//    
//    private func animation2() {
//        layer.strokeStart = 0.5
//        layer.strokeEnd = 0.5
//        
//        let animation = CABasicAnimation(keyPath: "strokeStart")
//        animation.fromValue = 0.5
//        animation.toValue = 0
//        animation.duration = 2
//        
//        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
//        animation2.fromValue = 0.5
//        animation2.toValue = 1
//        animation2.duration = 2
//        
//        layer.addAnimation(animation, forKey: "")
//        layer.addAnimation(animation2, forKey: "")
//    }
//    
//    private func animation3() {
//        let animation = CABasicAnimation(keyPath: "lineWidth")
//        animation.fromValue = 1
//        animation.toValue = 10
//        animation.duration = 2
//        layer.addAnimation(animation, forKey: "")
//    }
}
