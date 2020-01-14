//
//  CALayer+animation.m
//  SBSpinnerView
//
//  Created by Soumen Bhuin on 08/08/12.
//  Copyright (c) 2012 smbhuin. All rights reserved.

#import <QuartzCore/QuartzCore.h>
#import "CALayer+animation.h"

@implementation CALayer (animation)

- (void)rotateForeverWithSpeed:(float) speed ccw:(BOOL) ccw {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	animation.fromValue = [NSNumber numberWithFloat:0.0];
	animation.toValue = [NSNumber numberWithFloat:2 * M_PI*(ccw?-1:1)];
    animation.speed = speed;
	animation.repeatCount = HUGE_VALF;
	[self addAnimation:animation forKey:@"rotationAnim"];
}

- (void)removeRotateForeverAnimation {
    [self removeAnimationForKey:@"rotationAnim"];
}

@end
