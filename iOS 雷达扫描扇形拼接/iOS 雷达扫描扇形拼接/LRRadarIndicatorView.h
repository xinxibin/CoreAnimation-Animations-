//
//  XHRadarIndicatorView.h
//  XHRadarView
//
//  Created by 邱星豪 on 14/10/27.
//  Copyright (c) 2014年 邱星豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRRadarIndicatorView : UIView

@property (nonatomic, assign) CGFloat radius;           //半径
@property (nonatomic, assign) CGFloat radarSpeed;       // 转速
@property (nonatomic, assign) BOOL  isCustomSpeed;      // 是否自定义转速
- (void)scan;
- (void)stop;
@end
