//
//  LoadingView.h
//  仿58加载的loadingView
//
//  Created by Xinxibin on 16/7/11.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property (nonatomic) CAShapeLayer * shapeLayer;
@property (nonatomic) CAShapeLayer * whiteShapeLayer;

@property (nonatomic) CGPoint   viewCenterPoint;
- (void)startAnimation;
@end
