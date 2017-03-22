//
//  TriangleView.swift
//  仿 爱奇艺 加载动画 swift
//
//  Created by Xinxibin on 16/7/12.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class TriangleView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
                
        let width = self.frame.size.width * 0.65
        let width2 = width / (sqrt(3))
        
        let centerX = self.frame.size.width / 2
        let centerY = self.frame.size.width / 2
        
        let PointA=CGPointMake(centerX+(width*(2/3.0)), centerY);
        let PointB=CGPointMake(PointA.x-width, PointA.y-width2);
        let PointC=CGPointMake(PointB.x, PointB.y+2*width2);

        let path = UIBezierPath()
        path.moveToPoint(PointA)
        path.addLineToPoint(PointB)
        path.addLineToPoint(PointC)
        
        path.closePath()
        
        UIColor(red: 0.52, green: 0.67, blue: 0.07, alpha: 1.00).set()
        path.fill()
        
        // 连线
        path.stroke()
        
                
    }
    

}
