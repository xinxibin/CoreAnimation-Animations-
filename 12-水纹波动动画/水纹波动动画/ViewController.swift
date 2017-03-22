//
//  ViewController.swift
//  水纹波动动画
//
//  Created by Xinxibin on 16/8/9.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

// 资源地址 https://github.com/xinge1/LXWaveProgress


import UIKit

class ViewController: UIViewController {

    var gmView:GMView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gmView      = GMView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        gmView.center   = CGPointMake(CGRectGetMidX(self.view.bounds), 270)
        gmView.progress = 0.0
        gmView.waveHeight   = 5
        gmView.speed    = 0.5
        gmView.isShowSingleWave = false
        gmView.firstWaveColor = UIColor.init(red: 134/255.0, green: 116/255.0, blue: 210/255.0, alpha: 0.6)
        gmView.secondWaveColor = UIColor.init(red: 134/255.0, green: 116/255.0, blue: 210/255.0, alpha: 0.3)
        self.view.addSubview(gmView)
    
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(self.runAnimation), userInfo: nil, repeats: true)
    }
    
    @IBAction func onBtnClick(sender: AnyObject) {
        gmView.progress = 0.0

    }
    func runAnimation() {
        
        gmView.progress += 0.001
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

