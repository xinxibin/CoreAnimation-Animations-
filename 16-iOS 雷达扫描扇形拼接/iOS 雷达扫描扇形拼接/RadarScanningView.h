//
//  radarScanningView.h
//  iOS 雷达扫描扇形拼接
//
//  Created by Xinxibin on 16/7/25.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRRadarIndicatorView.h"

@interface RadarScanningView: UIView
@property (nonatomic, strong) LRRadarIndicatorView *indicatorView;      //指针
@property (nonatomic, assign) CGFloat radius;//半径

@end
