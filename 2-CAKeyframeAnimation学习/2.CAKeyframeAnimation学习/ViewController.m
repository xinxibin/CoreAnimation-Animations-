//
//  ViewController.m
//  2.CAKeyframeAnimation学习
//
//  Created by Xinxibin on 16/7/8.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    [self positionxCAKeyframeAnimtaion];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self positionxCAKeyframeAnimtaion];
    [self viewToCircularMotion];
    
}
// 学习资源地址 http://objccn.io/issue-12-1/
// 路径动画 圆周运动
- (void)viewToCircularMotion {
    
    // 坐标位置 怎么确定 ？
//    CGRect boundingRect = CGRectMake(0, 0, 10, 10);
    CGRect boundingRect = CGRectMake(CGRectGetMidX(_textField.frame)-200, CGRectGetMidY(_textField.frame)- 300 / 2.0, 300, 300);

    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath       = @"position";
    animation.path          = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    animation.duration      = 4;
    animation.additive      = true;
    animation.repeatCount   = HUGE_VALF;
    animation.calculationMode   = kCAAnimationPaced;
    // 旋转类型： kCAAnimationRotateAutoReverse 反转 kCAAnimationRotateAuto 正常
    // 如果不设置
    animation.rotationMode      = kCAAnimationRotateAuto;
    
    [self.myView.layer addAnimation:animation forKey:@"animation"];
    
    /**
     使用 CGPathCreateWithEllipseInRect()，我们创建一个圆形的 CGPath 作为我们的关键帧动画的 path。
     使用 calculationMode 是控制关键帧动画时间的另一种方法。
     我们通过将其设置为 kCAAnimationPaced，让 Core Animation 向被驱动的对象施加一个恒定速度，不管路径的各个线段有多长。
     将其设置为 kCAAnimationPaced 将无视所有我们已经设置的 keyTimes。
     
     */
}


// 使用CAKeyframeAnimation 实现多步动画，实现一个表单左右晃动；
- (void)positionxCAKeyframeAnimtaion {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    // values 数组定义了表单应该到哪些位置。
    animation.values = @[@0,@10,@-10,@10,@0];
    // 设置 keyTimes 属性让我们能够指定关键帧动画发生的时间。它们被指定为关键帧动画总持续时间的一个分数
    animation.keyTimes = @[ @0, @(1/6.0) , @(3/6.0), @(5/6.0), @1 ];
    animation.duration  = 0.4;
    animation.additive = true;
    
    [self.textField.layer addAnimation:animation forKey:@""];
    
    
    // 注：
    /**
     设置 additive 属性为 YES 使 Core Animation 在更新 presentation layer 之前将动画的值添加到 model layer 中去。
     这使我们能够对所有形式的需要更新的元素重用相同的动画，且无需提前知道它们的位置。
     因为这个属性从 CAPropertyAnimation 继承，所以你也可以在使用 CABasicAnimation 时使用它。
     
     */
}





// 下面的例子出自 ： http://blog.csdn.net/samuelltk/article/details/9048325
/*
添加动画结束的delegate
     CAKeyframeAnimation* animation;
     animation = [CAKeyframeAnimation animation];
     animation.delegate = self;
     [animation setValue:@"aaa" forKey:@"TAG"];
     
     - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
     {
        NSString *strTag = [anim valueForKey:@"TAG"];
        if ([strTag isEqualToString:@"aaa"]) {
        aniIsRuning = NO;
        }
     }
 */


//5.使用基于旋转的关键桢动画
- (void)cATransform3DAndCAKeyframeAnimation {
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotation1 = CATransform3DMakeRotation(30 * M_PI/180, 0, 0, -1);
    CATransform3D rotation2 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    CATransform3D rotation3 = CATransform3DMakeRotation(90 * M_PI/180, 0, 0, -1);
    CATransform3D rotation4 = CATransform3DMakeRotation(120 * M_PI/180, 0, 0, -1);
    CATransform3D rotation5 = CATransform3DMakeRotation(150 * M_PI/180, 0, 0, -1);
    CATransform3D rotation6 = CATransform3DMakeRotation(180 * M_PI/180, 0, 0, -1);
    
    [keyAnim setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        nil]];
    [keyAnim setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.2f],
                          [NSNumber numberWithFloat:0.4f],
                          [NSNumber numberWithFloat:0.6f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:1.0f],
                          nil]];
    [keyAnim setDuration:4];
    [keyAnim setFillMode:kCAFillModeForwards];
    [keyAnim setRemovedOnCompletion:NO];
    [self.myView.layer addAnimation:keyAnim forKey:nil];

}

//4.使用基于位置点的关键桢动画
- (void)cGPointAndCAKeyframeAnimation {
    CGPoint pt0 = CGPointMake(50.0, 120.0);
    CGPoint pt1 = CGPointMake(50.0, 275.0);
    CGPoint pt2 = CGPointMake(150.0, 275.0);
    CGPoint pt3 = CGPointMake(150.0, 120.0);
    CGPoint pt4 = CGPointMake(150.0, 275.0);
    CGPoint pt5 = CGPointMake(250.0, 275.0);
    CGPoint pt6 = CGPointMake(250.0, 120.0);
    CGPoint pt7 = CGPointMake(250.0, 275.0);
    CGPoint pt8 = CGPointMake(350.0, 275.0);
    CGPoint pt9 = CGPointMake(350.0, 120.0);
    CGPoint pt10 = CGPointMake(350.0, 275.0);
    CGPoint pt11 = CGPointMake(450.0, 275.0);
    CGPoint pt12 = CGPointMake(450.0, 120.0);
    NSArray *values = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:pt0],
                       [NSValue valueWithCGPoint:pt1],
                       [NSValue valueWithCGPoint:pt2],
                       [NSValue valueWithCGPoint:pt3],
                       [NSValue valueWithCGPoint:pt4],
                       [NSValue valueWithCGPoint:pt5],
                       [NSValue valueWithCGPoint:pt6],
                       [NSValue valueWithCGPoint:pt7],
                       [NSValue valueWithCGPoint:pt8],
                       [NSValue valueWithCGPoint:pt9],
                       [NSValue valueWithCGPoint:pt10],
                       [NSValue valueWithCGPoint:pt11],
                       [NSValue valueWithCGPoint:pt12], nil];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setValues:values];
    [anim setDuration:3.0];  
    [anim setAutoreverses:YES];  
    
    [self.myView.layer addAnimation:anim forKey:@"path"];
}

//3.使用基于路径的关键帧动画
- (void)cGMutablePathRefAnimation {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 50.0, 120.0);
    CGPathAddCurveToPoint(path, NULL, 50.0, 275.0, 150.0, 275.0, 150.0, 120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,250.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,350.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,450.0,120.0);
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setPath:path];
    [anim setDuration:3.0];
    [anim setAutoreverses:YES];
    CFRelease(path);
    [self.myView.layer addAnimation:anim forKey:@"path"];

}

//2.使用基于缩放的关键帧动画
- (void)scaleAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.25;
    
    [self.myView.layer addAnimation:animation forKey:@"DSPopUpAnimation"];

}


// 1.使用贝赛尔曲线路径的关键帧动画
- (void)UIBezierPathAndCAKeyframeAnimation {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-40, 100)];
    [path addLineToPoint:CGPointMake(360, 100)];
    [path addLineToPoint:CGPointMake(360, 200)];
    [path addLineToPoint:CGPointMake(-40, 200)];
    [path addLineToPoint:CGPointMake(-40, 300)];
    [path addLineToPoint:CGPointMake(360, 300)];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 8.0f;
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.myView.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
}

- (void)pathAnimation {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    CGMutablePathRef path=CGPathCreateMutable();
    
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    
    animation.path=path;
    
    CGPathRelease(path);
    
    animation.repeatCount=MAXFLOAT;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.duration = 4.0f;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.delegate=self;
    
    [self.myView.layer addAnimation:animation forKey:nil];
    
}

- (void)valuesAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    animation.calculationMode = kCAAnimationCubic;
    
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    animation.values=@[value1,value2,value3,value4,value5]; animation.repeatCount=MAXFLOAT;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.duration = 4.0f;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.delegate=self;
    
    [self.myView.layer addAnimation:animation forKey:nil];
}

@end











