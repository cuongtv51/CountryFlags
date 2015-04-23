//
//  KCBaseView.m
//  CountryFlags
//
//  Created by CuongTV on 3/11/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCBaseView.h"

@interface KCBaseView () {
    CGSize ratio;
}

@end

@implementation KCBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ratio = CGSizeMake(3, 2);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        ratio = CGSizeMake(3, 2);
    }
    return self;
}

-(void)drawRect: (CGRect)rect inContext:(CGContextRef)context
{
    // Subclass should call this
}

-(CGSize)defaultScaleRatio
{
    // Subclass should call this if don't want default scale ratio
    return ratio;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat height, width;
    ratio = [self defaultScaleRatio];
    // just draw in scale 3x2 by default
    if (rect.size.height > rect.size.width) {
        width = rect.size.width;
        height = rect.size.width * ratio.height / ratio.width;
        if (height > rect.size.height) {
            height = rect.size.height;
            width = height * ratio.width / ratio.height;
        }
    }
    else {
        height = rect.size.height;
        width = height * ratio.width / ratio.height;
        if (width > rect.size.width) {
            width = rect.size.width;
            height = width * ratio.height / ratio.width;
        }
    }
    
    CGRect drawRect = rect;
    drawRect.size.height = height;
    drawRect.size.width = width;
    // call
    [self drawRect:drawRect inContext:context];
}

- (CGSize) scaleRatio
{
    return ratio;
}
@end