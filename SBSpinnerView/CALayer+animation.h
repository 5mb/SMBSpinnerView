//
//  CALayer+animation.h
//  SBSpinnerView
//
//  Created by Soumen Bhuin on 08/08/12.
//  Copyright (c) 2012 smbhuin. All rights reserved.

@class CALayer;

@interface CALayer (animation)

/// rotate the layer forever with the given speed and direction around z axis
/// min speen = 0 (static/no rotation)
- (void)rotateForeverWithSpeed:(float) speed ccw:(BOOL) ccw;  // animation Id: rotationAnim

- (void)removeRotateForeverAnimation;

@end
