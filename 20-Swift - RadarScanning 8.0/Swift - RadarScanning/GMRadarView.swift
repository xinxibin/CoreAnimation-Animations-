//
//  GMRadarView.swift
//  Swift - RadarScanning
//
//  Created by Xinxibin on 16/7/25.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class GMRadarView: UIView {
    
    var headerBtn:UIButton!
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let path = UIBezierPath(arcCenter: (self.superview?.center)!, radius: UIScreen.main.bounds.size.width / 2 - 20, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        // 创建最外层的圆圈
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.fillColor    = UIColor.clear.cgColor
        shapeLayer.path         = path.cgPath
        
        self.layer.addSublayer(shapeLayer)
        
        // 穿件一个中心按钮
        headerBtn   = UIButton(type: .custom)
        headerBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        headerBtn.backgroundColor   = UIColor.white
        headerBtn.center            = (self.superview?.center)!
        headerBtn.addTarget(self, action: #selector(self.onButtonClick), for: .touchUpInside)
        headerBtn.layer.cornerRadius = 30
        self.addSubview(headerBtn)
    }
    
    func onButtonClick() {
        
        UIView.animate(withDuration: 0.5, animations: { 
            
            self.headerBtn.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            }) { (Bool) in
        
            let shapeLayer          = CAShapeLayer()
            shapeLayer.path         = self.smallPath()
            shapeLayer.strokeColor  = UIColor.gray.cgColor
            shapeLayer.fillColor    = UIColor.clear.cgColor
            shapeLayer.opacity      = 0.0
            self.layer.addSublayer(shapeLayer)
            
            let opacityAnimation        = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue  = 1
            opacityAnimation.toValue    = 0.2
            
            let scaleAnimation          = CABasicAnimation(keyPath: "path")
            scaleAnimation.fromValue    = self.smallPath()
                // NSValue.init(caTransform3D: CATransform3DScale(CATransform3DIdentity, 0, 0, 0))
            scaleAnimation.toValue      = self.bigPath()
                // NSValue.init(caTransform3D: CATransform3DScale(CATransform3DIdentity, 2, 2, 0))
            scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            
            let groupAnimation          = CAAnimationGroup()
            groupAnimation.animations   = [opacityAnimation,scaleAnimation]
            groupAnimation.duration     = 2
            groupAnimation.repeatCount  = 1
            groupAnimation.autoreverses = false
            shapeLayer.add(groupAnimation, forKey: "groupAnimation")
                
            UIView.animate(withDuration: 0.25, animations: { 
                self.headerBtn.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }

    }

    func bigPath() ->CGPath{
        
        let path = UIBezierPath(arcCenter: (self.superview?.center)!, radius: UIScreen.main.bounds.size.width / 2 - 20, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).cgPath
        return path
    }
    
    func smallPath() ->CGPath {
        
        let path = UIBezierPath(arcCenter: (self.superview?.center)!, radius: 78/2, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true).cgPath
        return path
    }
    
    var radarView:GMRadarIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    func setUI() {
        
        radarView = GMRadarIndicatorView(frame: self.bounds)
        radarView.radarColor = UIColor.white
        radarView.backgroundColor = UIColor.clear
        self.addSubview(radarView)
        
        radarView.startAnimation()
    }
    
}
