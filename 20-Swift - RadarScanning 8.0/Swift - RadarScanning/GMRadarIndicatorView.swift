//
//  GMRadarIndicatorView.swift
//  Swift - RadarScanning
//
//  Created by Xinxibin on 16/7/25.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

func angleToRadians(_ angle:CGFloat) ->CGFloat{
    
    return angle/180 * CGFloat(M_PI)
}

class GMRadarIndicatorView: UIView {

    var shapeLayer:CAShapeLayer!
    // 扫描线的颜色
    var radarColor:UIColor!
    // 方向 默认 顺时针
    var isClockwise:Bool = true
    // 扫描半径
    var radius:CGFloat = UIScreen.main.bounds.size.width / 2 - 20
    
    override func draw(_ rect: CGRect) {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: (self.superview?.center.x)!, y: (self.superview?.center.y)!))
        linePath.addArc(withCenter: (self.superview?.center)!, radius: radius, startAngle: angleToRadians(-1), endAngle: angleToRadians(0), clockwise: true)

        shapeLayer = createShapeLayer(linePath,alpha: 1)
        
        for i in 0..<135 {
            
            let linePath1 = UIBezierPath()
            linePath1.move(to: CGPoint(x: (self.superview?.center.x)!, y: (self.superview?.center.y)!))
            linePath1.addArc(withCenter: (self.superview?.center)!,
                             radius: radius,
                             startAngle: isClockwise ? angleToRadians(CGFloat(-i - 1)) : angleToRadians(CGFloat(i)),
                             endAngle: isClockwise ? angleToRadians(CGFloat(-i)) : angleToRadians(CGFloat(i + 1)),
                             clockwise: true)
            
            let layer = createShapeLayer(linePath1, alpha: CGFloat(135 - i)/500.0)
            shapeLayer.addSublayer(layer)
        }
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func createShapeLayer(_ path:UIBezierPath,alpha:CGFloat) -> CAShapeLayer{
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = (self.superview?.bounds)!
        shapeLayer.lineWidth    = 1
        shapeLayer.fillColor    = radarColor.cgColor
        shapeLayer.opacity      = Float(alpha)
        shapeLayer.path         = path.cgPath

        return shapeLayer;
    }
    
    func startAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = isClockwise ? 2 * M_PI : -2 * M_PI
        animation.duration = 4
        animation.isCumulative = true
        animation.repeatCount = HUGE
        
        self.layer.add(animation, forKey: "rotationAnimation")
    }
    
    func stopAnimation() {
        
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
}



























