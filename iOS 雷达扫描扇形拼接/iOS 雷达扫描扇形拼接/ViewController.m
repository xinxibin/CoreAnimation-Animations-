//
//  ViewController.m
//  iOS 雷达扫描扇形拼接
//
//  Created by Xinxibin on 16/7/22.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

#import "RadarScanningView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRadar];
}

- (void)createRadar {
    
    RadarScanningView * radarView = [[RadarScanningView alloc]initWithFrame:self.view.bounds];
    radarView.backgroundColor  = [UIColor clearColor];
    [self.view addSubview:radarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
