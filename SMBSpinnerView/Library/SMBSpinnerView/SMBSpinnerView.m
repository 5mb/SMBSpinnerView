//
//  SMBSpinnerView.m
//  SMBSpinnerView
//
//  Created by Soumen Bhuin on 09/08/12.
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


#import "SMBSpinnerView.h"
#import "SpinnerLayer.h"
#import "CALayer+animation.h"

#define DEFAULT_SPEED 0.2f

@implementation SMBSpinnerView
@synthesize color = _color;
@synthesize speed = _speed;
@synthesize hidesWhenStopped = _hidesWhenStopped;

- (id)init {
    if (self=[super init]) {
        self.color = [UIColor lightGrayColor];    //default value
        _speed = DEFAULT_SPEED;
        _hidesWhenStopped = YES;
        _spinnerLayer = [[SpinnerLayer alloc] init];
        [self.layer addSublayer:_spinnerLayer];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.color = [UIColor lightGrayColor];    //default value
        _speed = DEFAULT_SPEED;
        _hidesWhenStopped = YES;
        _spinnerLayer = [[SpinnerLayer alloc] init];
        [self.layer addSublayer:_spinnerLayer];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.color = [UIColor lightGrayColor];    //default value
        _speed = DEFAULT_SPEED;
        _hidesWhenStopped = YES;
        _spinnerLayer = [[SpinnerLayer alloc] init];
        [self.layer addSublayer:_spinnerLayer];
    }
    return self;
}


- (void)layoutSubviews {
    [_spinnerLayer setFrame:self.bounds];
    [_spinnerLayer setHeadColor:self.color];
    [_spinnerLayer setTailColor:[UIColor clearColor]];  //tail color
    [_spinnerLayer setNeedsDisplay];
}

- (void)startAnimation {
    [self setHidden:NO];
    [_spinnerLayer rotateForeverWithSpeed:_speed CCW:NO];
}

- (void)stopAnimation {
    if (_hidesWhenStopped) {
        [self setHidden:YES];
    }
    [_spinnerLayer removeRotateForeverAnimation];
}

- (void)dealloc {
    [_spinnerLayer release];
    [_color release];
    [super dealloc];
}

@end
