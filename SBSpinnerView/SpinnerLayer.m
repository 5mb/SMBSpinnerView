//
//  SpinnerLayer.m
//  SBSpinnerView
//
//  Created by Soumen Bhuin on 09/08/12.
//  Copyright (c) 2012 smbhuin. All rights reserved.

#import "SpinnerLayer.h"

@interface SBSpinnerLayer()

@end

@implementation SBSpinnerLayer

- (id)init {
	if (!(self = [super init]))
		return nil;
    self.backgroundColor = [UIColor clearColor].CGColor;
	self.needsDisplayOnBoundsChange = YES;
    
	return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    
    CGContextSetFillColorWithColor(ctx, self.backgroundColor);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    
    CGRect rect = CGContextGetClipBoundingBox(ctx);
    CGFloat strokeWidth =  CGRectGetHeight(rect)/10.0;
    CGContextSetLineWidth(ctx, strokeWidth);
    
    CGContextAddRect(ctx, CGRectInset(rect, strokeWidth/2.0, strokeWidth/2.0));
    
    CGContextStrokePath(ctx);
}


@end
