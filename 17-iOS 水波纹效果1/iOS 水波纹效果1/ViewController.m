//
//  ViewController.m
//  iOS 水波纹效果
//
//  Created by Xinxibin on 16/7/21.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"
#import "GMView.h"
@interface ViewController ()
@property (nonatomic , strong) GMView * centerRadarView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centerRadarView = [[GMView alloc] initWithFrame:CGRectMake(0, 0, 50 , 50)];
    self.centerRadarView.center = self.view.center;
    self.centerRadarView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_centerRadarView];
    
    
//    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
//    redView.center = self.centerRadarView.center;
//    redView.backgroundColor = [UIColor blackColor];
//    redView.layer.cornerRadius  = 75;
//    [self.view addSubview:redView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
