//
//  KCCnView.m
//  CountryFlags
//
//  Created by ACuong on 3/22/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCCnView.h"
#import "KCCommon.h"

@implementation KCCnView

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context
{
    // red background
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, rect);
    
    // stars
    CGFloat step = rect.size.height / 20.0;
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    // main star
    CGPoint points[10];
    KCPointsOfStar(CGPointMake(rect.origin.x + 5 * step, rect.origin.y + 5 * step), 3 * step, points);
    CGContextBeginPath(context);
    CGContextAddLines(context, points, sizeof(points)/ sizeof(points[0]));
    CGContextClosePath(context);
    
    KCPointsOfStar(CGPointMake(rect.origin.x + 10 * step, rect.origin.y + 2 * step), step, points);
    CGContextAddLines(context, points, sizeof(points)/ sizeof(points[0]));
    CGContextClosePath(context);

    KCPointsOfStar(CGPointMake(rect.origin.x + 10 * step, rect.origin.y + 9 * step), step, points);
    CGContextAddLines(context, points, sizeof(points)/ sizeof(points[0]));
    CGContextClosePath(context);
    
    KCPointsOfStar(CGPointMake(rect.origin.x + 12 * step, rect.origin.y + 4 * step), step, points);
    CGContextAddLines(context, points, sizeof(points)/ sizeof(points[0]));
    CGContextClosePath(context);
    
    KCPointsOfStar(CGPointMake(rect.origin.x + 12 * step, rect.origin.y + 7 * step), step, points);
    CGContextAddLines(context, points, sizeof(points)/ sizeof(points[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}

@end
