//
//  AnimationButton.swift
//  ButtonAnimation - 1
//
//  Created by Xinxibin on 16/7/7.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class AnimationButton: UIButton {
    
    var shapeLayer:CAShapeLayer!
    var shapeLayer2:CAShapeLayer!
    let r:CGFloat = (100/2 * 100/2) / 2
    var kpf:CGFloat = 0.0
    var path:UIBezierPath!
    var path2:UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var kpf = sqrt(r)

        let plusPath3 = UIBezierPath()
        plusPath3.lineWidth = 3
        plusPath3.move(to: CGPoint(x: bounds.width/2 - kpf , y: bounds.width/2 - kpf))
        plusPath3.addLine(to: CGPoint(x: bounds.width/2 + kpf , y: bounds.width/2 + kpf))
        UIColor.white.setStroke()
        plusPath3.stroke()
        
        let plusPath31 = UIBezierPath()
        plusPath31.lineWidth = 3
        plusPath31.move(to: CGPoint(x: bounds.width/2 - kpf , y: bounds.width/2 + kpf))
        plusPath31.addLine(to:  CGPoint(x: bounds.width/2 + kpf  , y: bounds.width/2 - kpf))
        UIColor.white.setStroke()
        plusPath31.stroke()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        kpf = sqrt(r)

        self.isSelected = false
        self.addTarget(self, action: #selector(AnimationButton.touchUpInside(sender:)), for: UIControlEvents.touchUpInside)
        self.layer.cornerRadius = 50
        
        path = UIBezierPath()
        path.move(to: CGPoint(x: 20, y: 50))
        path.addLine(to: CGPoint(x: 80, y: 50))
        
        shapeLayer          = CAShapeLayer()
        shapeLayer.fillColor    = UIColor.clear.cgColor
        shapeLayer.strokeColor  = UIColor.red.cgColor
        shapeLayer.lineWidth    = 4
        shapeLayer.lineJoin     = kCALineJoinRound
        shapeLayer.lineCap      = kCALineCapRound
        shapeLayer.path         = path.cgPath
        shapeLayer.speed        = 0.5
        self.layer.addSublayer(shapeLayer)
        
        let animationPath = CABasicAnimation(keyPath: "strokeEnd")
        animationPath.duration      = 0.5
        animationPath.fromValue     = NSNumber(floatLiteral: 0.0)
        animationPath.toValue       = NSNumber(floatLiteral: 1.0)
        shapeLayer.add(animationPath, forKey: nil)
        
        path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 50, y: 20))
        path2.addLine(to: CGPoint(x: 50, y: 80))
        
        shapeLayer2          = CAShapeLayer()
        shapeLayer2.fillColor    = UIColor.clear.cgColor
        shapeLayer2.strokeColor  = UIColor.red.cgColor
        shapeLayer2.lineWidth    = 4
        shapeLayer2.lineJoin     = kCALineJoinRound
        shapeLayer2.lineCap      = kCALineCapRound
        shapeLayer2.path         = path2.cgPath
        shapeLayer2.speed        = 0.5
        self.layer.addSublayer(shapeLayer2)
        
        
        let animationPath2 = CABasicAnimation(keyPath: "strokeEnd")
        animationPath2.duration      = 0.5
        animationPath2.fromValue     = NSNumber(floatLiteral: 0.0)
        animationPath2.toValue       = NSNumber(floatLiteral: 1.0)
        shapeLayer2.add(animationPath2, forKey: nil)

        
    }
    
    
    func touchUpInside(sender:AnyObject) {
        
        if !self.isSelected {
            
            // 改变path的初始 结束位置
            // 楠
            path.removeAllPoints()
            path.move(to: CGPoint(x: bounds.width/2 - kpf , y: bounds.width/2 - kpf))
            path.addLine(to: CGPoint(x: bounds.width/2 + kpf , y: bounds.width/2 + kpf))
            UIColor.red.setStroke()
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.path = path.cgPath
            
            // 丿
            path2.removeAllPoints()
            path2.move(to: CGPoint(x: bounds.width/2 - kpf , y: bounds.width/2 + kpf))
            path2.addLine(to:  CGPoint(x: bounds.width/2 + kpf  , y: bounds.width/2 - kpf))
            UIColor.red.setStroke()
            shapeLayer2.strokeColor = UIColor.red.cgColor
            shapeLayer2.path = path2.cgPath
            
            // 只是改变path的长短
            shapeLayer.strokeStart      = 0.2
            shapeLayer.strokeEnd        = 0.8
            
            shapeLayer2.strokeStart     = 0.2
            shapeLayer2.strokeEnd       = 0.8
            
            
            self.isSelected = true
            
        } else {
            
            // 改变path的初始 结束位置
            // 竖
            
            path.removeAllPoints()
            path.move(to: CGPoint( x:bounds.width/2 + 0.5, y:bounds.height/2 - 100/2 + 0.5))
            UIColor.white.setStroke()
            path.addLine(to: CGPoint( x:bounds.width/2 + 0.5, y:bounds.height/2 + 100/2 + 0.5))
            shapeLayer.strokeColor = UIColor.blue.cgColor
            shapeLayer.path = path.cgPath
            
            // 橫
            path2.removeAllPoints()
            path2.move(to: CGPoint( x:bounds.width/2 - 100/2 + 0.5, y:bounds.height/2 + 0.5))
            path2.addLine(to: CGPoint( x:bounds.width/2 + 100/2 + 0.5, y:bounds.height/2 + 0.5))
            UIColor.blue.setStroke()
            shapeLayer2.strokeColor = UIColor.blue.cgColor
            shapeLayer2.path = path2.cgPath
            
            // 只是改变path的长短
            shapeLayer.strokeStart      = 0.2
            shapeLayer.strokeEnd        = 0.8
            
            shapeLayer2.strokeStart     = 0.2
            shapeLayer2.strokeEnd       = 0.8
//

            
            self.isSelected = false
            print("else")
        }

        
    }

}
