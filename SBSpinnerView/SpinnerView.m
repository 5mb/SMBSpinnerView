//
//  SpinnerView.m
//  SBSpinnerView
//
//  Created by Soumen Bhuin on 09/08/12.
//  Copyright (c) 2012 smbhuin. All rights reserved.

#import "SpinnerView.h"
#import "SpinnerLayer.h"
#import "CALayer+animation.h"

#define DEFAULT_SPEED 0.2f

@interface SBSpinnerView()

@property(strong) SBSpinnerLayer *spinnerLayer;

@end

@implementation SBSpinnerView

- (id)init {
    if (self = [super init]) {
        [self setupDefalts];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefalts];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setupDefalts];
    }
    return self;
}

- (void)setupDefalts {
    self.color = [UIColor darkGrayColor];
    _speed = DEFAULT_SPEED;
    _hidesWhenStopped = YES;
    _spinnerLayer = [[SBSpinnerLayer alloc] init];
    [self.layer addSublayer:_spinnerLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat side = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/1.414;
    [_spinnerLayer setFrame:CGRectMake((CGRectGetMaxX(self.bounds)-side)/2, (CGRectGetMaxY(self.bounds)-side)/2, side, side)];
    [_spinnerLayer setColor:self.color];
    [_spinnerLayer setNeedsDisplay];
}

- (void)startAnimating {
    [self setHidden:NO];
    [_spinnerLayer rotateForeverWithSpeed:_speed ccw:NO];
}

- (void)stopAnimating {
    if (_hidesWhenStopped) {
        [self setHidden:YES];
    }
    [_spinnerLayer removeRotateForeverAnimation];
}

@end
