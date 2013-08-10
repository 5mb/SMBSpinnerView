//
//  CALayer+animation.m
//  SMBSpinnerView
//
//  Created by Soumen Bhuin on 08/08/12.
//  Copyright (c) 2012 SMB. All rights reserved.

//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


#import <QuartzCore/QuartzCore.h>
#import "CALayer+animation.h"

@implementation CALayer (animation)

- (void)rotateForeverWithSpeed:(float) speed CCW:(BOOL) isCCW {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	animation.fromValue = [NSNumber numberWithFloat:0.0];
	animation.toValue = [NSNumber numberWithFloat:2 * M_PI*(isCCW?-1:1)];
    animation.speed = speed;
	animation.repeatCount = HUGE_VALF;
	[self addAnimation:animation forKey:@"rotationAnim"];
}

- (void)removeRotateForeverAnimation {
    [self removeAnimationForKey:@"rotationAnim"];
}

@end
