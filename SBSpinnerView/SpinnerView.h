//
//  SpinnerView.h
//  SBSpinnerView
//
//  Created by Soumen Bhuin on 09/08/12.
//  Copyright (c) 2012 smbhuin. All rights reserved.

#import <UIKit/UIKit.h>

@class SBSpinnerLayer;

@interface SBSpinnerView : UIView

/// Set the color of spinner
@property(readwrite, nonatomic, strong) UIColor *color;

/// Set rotation speed of spinner default=0.2f
@property(nonatomic) float speed;

/// Default is YES. calls `setHidden` when animating gets set to NO
@property(nonatomic) BOOL hidesWhenStopped;

@property(nonatomic, readonly, getter=isAnimating) BOOL animating;

/// Starts animation
- (void)startAnimating;

/// Stops animation
- (void)stopAnimating;

@end
