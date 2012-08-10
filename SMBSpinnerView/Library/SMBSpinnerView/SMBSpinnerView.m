//
//  SMBSpinnerView.m
//  SMBSpinnerView
//
//  Created by SMB on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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

@implementation SMBSpinnerView
@synthesize color = _color;

- (id)init {
    if (self=[super init]) {
        self.color = [UIColor redColor];    //default value
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
        self.color = [UIColor redColor];    //default value
        _spinnerLayer = [[SpinnerLayer alloc] init];
        [self.layer addSublayer:_spinnerLayer];
    }
    return self;
}


- (void)layoutSubviews {
    [_spinnerLayer setFrame:self.bounds];
    [_spinnerLayer setHeadColor:self.color];
    [_spinnerLayer setTailColor:[UIColor whiteColor]];  //tail color
    [_spinnerLayer setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)startAnimation {
    [_spinnerLayer rotateForeverWithSpeed:0.3f CCW:YES];
}

- (void)stopAnimation {
    [_spinnerLayer removeRotateForeverAnimation];
}

- (void)dealloc {
    [_spinnerLayer release];
    [_color release];
    [super dealloc];
}

@end
