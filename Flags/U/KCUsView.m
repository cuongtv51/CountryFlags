//
//  KCUsView.m
//  CountryFlags
//
//  Created by ACuong on 3/20/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCUsView.h"
#import "KCCommon.h"

@implementation KCUsView

-(CGSize)defaultScaleRatio
{
    return CGSizeMake(1.9, 1.0);
}

-(void)drawRect: (CGRect)rect inContext:(CGContextRef)context
{
    // background of lines
    CGFloat rowHeight = rect.size.height / 13.0;
    for (NSUInteger i = 0; i < 13; i++) {
        if (i % 2 == 0) {    // red row
            CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.698 green:0.132 blue:0.203 alpha:1.0] CGColor]);
        }
        else {  // white row
            CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        }
        CGRect drawRect = rect;
        drawRect.origin.y = i * rowHeight;
        drawRect.size.height = rowHeight;
        CGContextFillRect(context, drawRect);
    }
    // background for stars
    CGFloat __height = rect.size.height * 7.0/13.0;
    CGFloat __width = rect.size.width * 2.0/5.0;
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.234 green:0.233 blue:0.430 alpha:1.0] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, __width, __height));
    
    // white stars
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGFloat radius = (rowHeight * 4.0/5.0) / 2.0;
    CGFloat stepHeight = __height / 10.0;
    CGFloat stepWidth = __width / 12.0;
    for (NSUInteger i = 1; i < 10; i++) {
        CGPoint centerPoint;
        centerPoint.y = rect.origin.y + i * stepHeight;
        for (NSUInteger j = 1; j < 12; j++) {
            if (i % 2) {
                if (j % 2) {
                    centerPoint.x = rect.origin.x + j * stepWidth;
                }
                else {
                    continue;
                }
            }
            else {
                if (j % 2) {
                    continue;
                }
                else {
                    centerPoint.x = rect.origin.x + j * stepWidth;
                }
            }
            CGPoint points[10];
            KCPointsOfStar(centerPoint, radius, points);
            CGContextBeginPath(context);
            CGContextAddLines(context, points, sizeof(points) / sizeof(points[0]));
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFill);
        }
    }
}

@end
