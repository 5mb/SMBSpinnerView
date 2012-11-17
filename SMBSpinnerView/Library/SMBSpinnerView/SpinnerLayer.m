//
//  SpinnerLayer.m
//  SMBAnimation
//
//  Created by SMB on 09/08/12.
//  A forked copy of AngleGradientLayer by Pavel Ivashkov
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


#import "SpinnerLayer.h"

#define byte unsigned char
#define uint unsigned int
#define F2CC(x) ((byte)(255 * x))
#define RGBAF(r,g,b,a) (F2CC(r) << 24 | F2CC(g) << 16 | F2CC(b) << 8 | F2CC(a))
#define RGBA(r,g,b,a) ((byte)r << 24 | (byte)g << 16 | (byte)b << 8 | (byte)a)
#define RGBA_R(c) ((uint)c >> 24 & 255)
#define RGBA_G(c) ((uint)c >> 16 & 255)
#define RGBA_B(c) ((uint)c >> 8 & 255)
#define RGBA_A(c) ((uint)c >> 0 & 255)

@interface SpinnerLayer()

/* The array of CGColorRef objects defining the color of each gradient
 * stop. Defaults to nil. */

@property(copy) NSArray *colors;

/* An optional array of NSNumber objects defining the location of each
 * gradient stop as a value in the range [0,1]. The values must be
 * monotonically increasing. If a nil array is given, the stops are
 * assumed to spread uniformly across the [0,1] range. When rendered,
 * the colors are mapped to the output colorspace before being
 * interpolated. Defaults to nil. */

@property(copy) NSArray *locations;

- (CGImageRef)newImageGradientInRect:(CGRect)rect;

@end

static void angleGradient(byte* data, int w, int h, int* colors, int colorCount, float* locations, int locationCount);

@implementation SpinnerLayer
@synthesize colors = _colors;
@synthesize locations = _locations;
@synthesize headColor = _headColor;
@synthesize tailColor = _tailColor;

- (id)init
{
	if (!(self = [super init]))
		return nil;
    self.backgroundColor = [UIColor clearColor].CGColor;
	self.needsDisplayOnBoundsChange = YES;
    
	return self;
}

- (void)dealloc
{
	[_colors release];
	[_locations release];
    [_headColor release];
    [_tailColor release];
	[super dealloc];
}

- (void)drawInContext:(CGContextRef)ctx
{
    //clear the context with transparent color
	CGContextSetFillColorWithColor(ctx, self.backgroundColor);
    
    //Get the bounds of current layer
    CGRect selfRec = CGContextGetClipBoundingBox(ctx);
    
    //calculate dimentions
	CGFloat midX = CGRectGetMidX(selfRec);
	CGFloat midY = CGRectGetMidY(selfRec);
    CGFloat minDepth = CGRectGetWidth(selfRec)>CGRectGetHeight(selfRec)?CGRectGetHeight(selfRec)
    :CGRectGetWidth(selfRec);
	CGRect circleRec = CGRectMake(midX-(minDepth/2), midY-(minDepth/2), minDepth, minDepth);
    CGFloat circleBorderWidth = minDepth/10;
    
    //save current graphics state
	CGContextSaveGState(ctx);

    //draw circle
	CGContextAddEllipseInRect(ctx, circleRec);
	CGContextAddArc(ctx, CGRectGetMidX(circleRec), CGRectGetMidY(circleRec), (minDepth/2)-circleBorderWidth, (0-90)*M_PI/180.0, (360-90)*M_PI/180.0, 1);
    
    //CGContextAddEllipseInRect(ctx, CGRectInset(circleRec, circleBorderWidth, circleBorderWidth));
    
	CGContextClip(ctx);
    
	CGImageRef img = [self newImageGradientInRect:circleRec];
	CGContextDrawImage(ctx, circleRec, img);
	CGImageRelease(img);
    
    //restore current graphics state
	CGContextRestoreGState(ctx);
    
    //draw paths
	CGContextDrawPath(ctx, kCGPathFill);

    

}

- (CGImageRef)newImageGradientInRect:(CGRect)rect
{
    
    self.colors = [NSArray arrayWithObjects:(id)self.headColor.CGColor, (id)self.tailColor.CGColor, nil];
    
	int w = CGRectGetWidth(rect);
	int h = CGRectGetHeight(rect);
	int bitsPerComponent = 8;
	int bpp = 4 * bitsPerComponent / 8;
	int byteCount = w * h * bpp;
    
	int colorCount = self.colors.count;
	int locationCount = 0;
	int* colors = NULL;
	float* locations = NULL;
    
	if (colorCount > 0) {
		colors = calloc(colorCount, bpp);
		int *p = colors;
		for (id cg in self.colors) {
			float r, g, b, a;
			UIColor *c = [[UIColor alloc] initWithCGColor:(CGColorRef)cg];
			if (![c getRed:&r green:&g blue:&b alpha:&a]) {
				if (![c getWhite:&r alpha:&a]) {
					[c release];
					continue;
				}
				g = b = r;
			}
			[c release];
			*p++ = RGBAF(r, g, b, a);
		}
	}
	if (self.locations.count > 0 && self.locations.count == colorCount) {
		locationCount = self.locations.count;
		locations = calloc(locationCount, sizeof(locations[0]));
		float *p = locations;
		for (NSNumber *n in self.locations) {
			*p++ = [n floatValue];
		}
	}
    
	byte* data = malloc(byteCount);
	angleGradient(data, w, h, colors, colorCount, locations, locationCount);
    
	if (colors) free(colors);
	if (locations) free(locations);
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Little;
	CGContextRef ctx = CGBitmapContextCreate(data, w, h, bitsPerComponent, w * bpp, colorSpace, bitmapInfo);
	CGColorSpaceRelease(colorSpace);
	CGImageRef img = CGBitmapContextCreateImage(ctx);
	CGContextRelease(ctx);
	free(data);
	return img;
}

@end

static inline byte blerp(byte a, byte b, float w)
{
	return a + w * (b - a);
}
static inline int lerp(int a, int b, float w)
{
	return RGBA(blerp(RGBA_R(a), RGBA_R(b), w),
				blerp(RGBA_G(a), RGBA_G(b), w),
				blerp(RGBA_B(a), RGBA_B(b), w),
				blerp(RGBA_A(a), RGBA_A(b), w));
}

void angleGradient(byte* data, int w, int h, int* colors, int colorCount, float* locations, int locationCount)
{
	if (colorCount < 1) return;
	if (locationCount > 0 && locationCount != colorCount) return;
    
	int* p = (int*)data;
	float centerX = (float)w / 2;
	float centerY = (float)h / 2;
    
	for (int y = 0; y < h; y++)
        for (int x = 0; x < w; x++) {
            float dirX = x - centerX;
            float dirY = y - centerY;
            float angle = atan2f(dirY, dirX);
            if (dirY < 0) angle += 2 * M_PI;
            angle /= 2 * M_PI;
            
            int index = 0, nextIndex = 0;
            float t = 0;
            
            if (locationCount > 0) {
                for (index = locationCount - 1; index >= 0; index--) {
                    if (angle >= locations[index]) {
                        break;
                    }
                }
                if (index >= locationCount) index = locationCount - 1;
                nextIndex = index + 1;
                if (nextIndex >= locationCount) nextIndex = locationCount - 1;
                float ld = locations[nextIndex] - locations[index];
                t = ld <= 0 ? 0 : (angle - locations[index]) / ld;
            }
            else {
                t = angle * (colorCount - 1);
                index = t;
                t -= index;
                nextIndex = index + 1;
                if (nextIndex >= colorCount) nextIndex = colorCount - 1;
            }
            
            int lc = colors[index];
            int rc = colors[nextIndex];
            int color = lerp(lc, rc, t);
            *p++ = color;
        }
}
