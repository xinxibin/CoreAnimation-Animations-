//
//  ViewController.swift
//  ios 渐变loading
//
//  Created by Xinxibin on 16/8/3.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createLine()
    }

    func createLine() {
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(20,100))
        path.addLineToPoint(CGPointMake(40, 100))
        
        let shapeLayer              = CAShapeLayer()
        shapeLayer.lineWidth        = 3
        shapeLayer.strokeColor      = UIColor.blackColor().CGColor
        shapeLayer.fillColor        = UIColor.clearColor().CGColor
        shapeLayer.path             = path.CGPath
        
        self.view.layer.addSublayer(shapeLayer);
        
        // 基础渐变
        // 所以左上角坐标是{0, 0}，右下角坐标是{1, 1}
        let gradientLayer           = CAGradientLayer()
        gradientLayer.frame         = CGRect(x: 10, y: 120, width: 355, height: 20)
        self.view.layer.addSublayer(gradientLayer)
        gradientLayer.colors        = [ UIColor.blackColor().CGColor, UIColor.whiteColor().CGColor ]
        gradientLayer.startPoint    = CGPointMake(0, 0.5)
        gradientLayer.endPoint      = CGPointMake(1, 0.5)
        
        
        // 多重渐变
        /**
         colors属性可以包含很多颜色，所以创建一个彩虹一样的多重渐变也是很简单的
         默认情况下，这些颜色在空间上均匀地被渲染，但是我们可以用locations属性来调整空间。
         locations属性是一个浮点数值的数组（以NSNumber包装
         单位坐标系进行标定。0.0代表着渐变的开始，1.0代表着结束。
         */
        let gradientLayer1           = CAGradientLayer()
        gradientLayer1.frame         = CGRect(x: 10, y: 160, width: 355, height: 20)
        self.view.layer.addSublayer(gradientLayer1)
        gradientLayer1.colors        = [ UIColor.redColor().CGColor, UIColor.yellowColor().CGColor,UIColor.greenColor().CGColor ]
        gradientLayer1.startPoint    = CGPointMake(0, 0.5)
        gradientLayer1.endPoint      = CGPointMake(1, 0.5)
        gradientLayer1.locations     = [0.3,0.7,0.8]
        
        
        // 圆形渐变进度条
        let path2       = UIBezierPath(arcCenter: CGPointMake(375.0/2, 667.0/2), radius: 50, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        let shapeLayer2     = CAShapeLayer()
        shapeLayer2.frame   = CGRectMake(0, 0, 100, 100)
        shapeLayer2.strokeColor = UIColor.blackColor().CGColor
        shapeLayer2.fillColor   = UIColor.clearColor().CGColor
        shapeLayer2.lineCap     = kCALineCapRound
        shapeLayer2.lineWidth   = 4
        shapeLayer2.opacity     = 0.25
        shapeLayer2.path        = path2.CGPath
        self.view.layer.addSublayer(shapeLayer2)
    }

}







