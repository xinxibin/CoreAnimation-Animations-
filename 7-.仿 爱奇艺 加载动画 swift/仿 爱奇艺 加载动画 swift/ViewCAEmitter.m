//
//  ViewCAEmitter.m
//  DemoCAEmitterLayer
//
//  Created by Chris Hu on 16/6/14.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "ViewCAEmitter.h"

@interface ViewCAEmitter ()

@property (nonatomic, strong) CAEmitterLayer *emittter1;
@property (nonatomic, strong) CAEmitterLayer *emittter2;

@end

@implementation ViewCAEmitter

+ (Class)layerClass {
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCAEmitterLayer];
    }
    return self;
}

- (void)initCAEmitterLayer {
    CGPoint position = CGPointMake(CGRectGetWidth(self.frame) + 50, CGRectGetHeight(self.frame) - 100);
    _emittter1 = [self addCAEmitterWithImage:@"star.png" andPosition:position];
    _emittter2 = [self addCAEmitterWithImage:@"circle.png" andPosition:_emittter1.emitterPosition];
}

#pragma mark - CAEmitterLayer related

- (CAEmitterLayer *)addCAEmitterWithImage:(NSString *)imageName andPosition:(CGPoint)position {
    
    // create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.bounds;
    [self.layer addSublayer:emitter];
    
    // configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = position;
    
    // create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:imageName].CGImage;
    cell.yAcceleration = -10.f;
    cell.xAcceleration = -110.f;
    cell.birthRate = 2.f;
    cell.lifetime = 6.f;
    cell.alphaSpeed = -0.3f;
    cell.velocity = 30.f;
    cell.velocityRange = 30.f;
    cell.emissionRange = M_PI * 10.f;
    
    // add particle template to emitter
    emitter.emitterCells = @[cell];
    
    return emitter;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
