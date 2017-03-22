//
//  ViewController.swift
//  Swift - RadarScanning
//
//  Created by Xinxibin on 16/7/25.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radarView = GMRadarView(frame: self.view.bounds)
        radarView.backgroundColor  = UIColor.clear
        self.view.addSubview(radarView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

