//
//  ViewController.swift
//  iOS CAGradientLayer 详解
//
//  Created by Xinxibin on 16/8/8.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var gradientView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI1()
        createUI2()
    }

    
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

}

/**
 
 public var colors: [AnyObject]?
 public var locations: [NSNumber]?
 public var startPoint: CGPoint
 public var endPoint: CGPoint
 public var type: String
 
 */

