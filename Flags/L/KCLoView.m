//
//  KCLoView.m
//  CountryFlags
//
//  Created by ACuong on 3/22/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCLoView.h"

@implementation KCLoView

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context
{
    CGFloat stepHeight = rect.size.height / 4.0;
    // lines colors
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, stepHeight));
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight, rect.size.width, stepHeight * 2));
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight * 3, rect.size.width, stepHeight));
    // circle in center
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillEllipseInRect(context, CGRectResize(rect, CGSizeMake(stepHeight * 1.6, stepHeight * 1.6)));
}

@end
