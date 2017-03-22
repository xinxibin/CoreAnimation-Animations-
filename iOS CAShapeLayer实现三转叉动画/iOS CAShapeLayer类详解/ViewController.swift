//
//  ViewController.swift
//  iOS CAShapeLayer类详解
//
//  Created by Xinxibin on 16/7/19.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonShapeView: UIButton!
    
    @IBOutlet weak var topButtonShapeView: UIButton!
    
    var shapeLayer:CAShapeLayer!
    
    var shapeLayer2:CAShapeLayer!

    var i:CGFloat = 0.0
    
    var x:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.frame    = self.buttonShapeView.bounds
        shapeLayer.path     = getStar1BezierPath().CGPath
        shapeLayer.fillColor=UIColor.clearColor().CGColor
        shapeLayer.strokeColor  = UIColor.redColor().CGColor
        shapeLayer.lineCap      = kCALineCapButt
        shapeLayer.lineJoin     = kCALineJoinBevel
        shapeLayer.lineWidth    = 6.0
        self.buttonShapeView.layer.addSublayer(shapeLayer)
        
        shapeLayer2 = CAShapeLayer()
        shapeLayer2.frame    = self.topButtonShapeView.bounds
        shapeLayer2.path     = getStar1BezierPath().CGPath
        shapeLayer2.fillColor=UIColor.clearColor().CGColor
        shapeLayer2.strokeColor  = UIColor.redColor().CGColor
        shapeLayer2.lineCap      = kCALineCapButt
        shapeLayer2.lineJoin     = kCALineJoinBevel
        shapeLayer2.lineWidth    = 6.0
        self.topButtonShapeView.layer.addSublayer(shapeLayer2)

        
    }
    
    func getStar1BezierPath() -> UIBezierPath{
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(10, 12))
        path.addLineToPoint(CGPointMake(50, 12))

        let path2 = UIBezierPath()
        path2.moveToPoint(CGPointMake(10, 30))
        path2.addLineToPoint(CGPointMake(50, 30))
        
        let path3 = UIBezierPath()
        path3.moveToPoint(CGPointMake(10, 48))
        path3.addLineToPoint(CGPointMake(50, 48))

        path.appendPath(path2)
        path.appendPath(path3)

        return path
    }

    func getStar2BezierPath() -> UIBezierPath{
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(10, 12))
        path.addLineToPoint(CGPointMake(50, 48))
        
        let path2 = UIBezierPath()
        path2.moveToPoint(CGPointMake(30, 30))
        path2.addLineToPoint(CGPointMake(30, 30))
        
        let path3 = UIBezierPath()
        path3.moveToPoint(CGPointMake(10, 48))
        path3.addLineToPoint(CGPointMake(50, 12))
        
        path.appendPath(path2)
        path.appendPath(path3)
        
        return path
    }
    
    @IBAction func onBtnClick(sender: AnyObject) {
        
        var shapelayer = CAShapeLayer()
        if sender.tag == 1 {
            shapelayer = self.shapeLayer
        } else {
            shapelayer = self.shapeLayer2
        }
        
        if i == 0 {
            // menu---> 叉
            let animation = CABasicAnimation(keyPath: "path")
            animation.removedOnCompletion    = false
            animation.fillMode = kCAFillModeForwards
            animation.duration               = 0.25
            animation.fromValue              = getStar1BezierPath().CGPath
            animation.toValue                = getStar2BezierPath().CGPath
            animation.timingFunction         = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            shapelayer.path             = getStar2BezierPath().CGPath
            
            let keyanimation = CAKeyframeAnimation(keyPath: "transform.scale")
            keyanimation.values = [1, 1.2,0.8, 1]
            keyanimation.calculationMode = kCAAnimationCubic
            
            let group = CAAnimationGroup()
            if sender.tag == 1 {
                group.animations = [animation,keyanimation]
            }else {
                group.animations = [animation]
            }
            shapelayer.addAnimation(group, forKey: "CAAnimationGroup")
            
            i = 1
        } else {
            // 叉---> menu
            let animation = CABasicAnimation(keyPath: "path")
            animation.removedOnCompletion    = false
            animation.duration               = 0.25
            animation.fromValue              = getStar2BezierPath().CGPath
            animation.toValue                = getStar1BezierPath().CGPath
            animation.timingFunction         = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            shapelayer.path             = getStar1BezierPath().CGPath
            
            let keyanimation = CAKeyframeAnimation(keyPath: "transform.scale")
            keyanimation.values = [1, 1.2,0.8, 1]
            keyanimation.calculationMode = kCAAnimationCubic
            
            let group = CAAnimationGroup()
            if sender.tag == 1 {
                group.animations = [animation,keyanimation]
            }else {
                group.animations = [animation]
            }

            shapelayer.addAnimation(group, forKey: "CAAnimationGroup")
            
            i = 0
        }

        
    }
}





