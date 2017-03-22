//
//  ViewController.m
//  iOS 渐变圆
//
//  Created by Xinxibin on 16/8/3.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "ViewController.h"
#import "GMView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet GMView *gmView;
- (IBAction)sliderChangesValue:(UISlider *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gmView.persentage = 0.5;
    
}


- (IBAction)sliderChangesValue:(UISlider *)sender {
    
    self.gmView.persentage = sender.value;

}
@end
