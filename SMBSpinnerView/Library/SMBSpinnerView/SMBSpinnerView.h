//
//  SMBSpinnerView.h
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


#import <UIKit/UIKit.h>

@class SpinnerLayer;


@interface SMBSpinnerView : UIView {
    @private
    SpinnerLayer *_spinnerLayer;
    UIColor *_color;
    float _speed;
    BOOL _hidesWhenStopped;
}
//set the color of spinner
@property(nonatomic, retain) UIColor *color;

//set rotation speed of spinner default=0.2f
@property(nonatomic, assign) float speed;

//default is YES. calls -setHidden when animating gets set to NO
@property(nonatomic, assign) BOOL hidesWhenStopped;

//starts rotation animation
- (void)startAnimation;
//stops rotation animation
- (void)stopAnimation;
@end
