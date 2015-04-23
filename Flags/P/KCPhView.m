//
//  KCPhView.m
//  CountryFlags
//
//  Created by ACuong on 3/22/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCPhView.h"
#import "KCCommon.h"

@implementation KCPhView

-(CGSize)defaultScaleRatio
{
    return CGSizeMake(2, 1);
}

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context
{
    // colors
    UIColor *whiteColor = [UIColor whiteColor];
    UIColor *yellowColor = [UIColor colorWithRed:252.0/256.0 green:209.0/256.0 blue:22.0/256.0 alpha:1];
    UIColor *redColor = [UIColor colorWithRed:206.0/256.0 green:17.0/256.0 blue:38.0/256.0 alpha:1];
    UIColor *blueColor = [UIColor colorWithRed:0 green:56.0/256.0 blue:168.0/256.0 alpha:1];
    
    CGContextSetFillColorWithColor(context, [redColor CGColor]);
    CGContextFillRect(context, CGRectMidleTop(rect));
    CGContextSetFillColorWithColor(context, [blueColor CGColor]);
    CGContextFillRect(context, CGRectMidleBottom(rect));
    // calculate points of white triangle
    CGAffineTransform transformRotate30 = CGAffineTransformMakeRotation(M_PI / 6.0);
    CGPoint rightPoint = CGPointApplyAffineTransform(CGPointMake(rect.origin.x + rect.size.height, rect.origin.y), transformRotate30);
    CGPoint trianglePoints[] = {rect.origin,
                                rightPoint,
                                CGPointMake(rect.origin.x, rect.origin.y + rect.size.height)};

    CGContextSetFillColorWithColor(context, [whiteColor CGColor]);
    CGContextBeginPath(context);
    CGContextAddLines(context, trianglePoints, sizeof(trianglePoints) / sizeof(trianglePoints[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
    // stars
    // draw top left star
    CGAffineTransform transformRotate60 = CGAffineTransformMakeRotation( M_PI / 3.0);
    CGPoint centerTopLeft = CGPointApplyAffineTransform(CGPointMake(rect.origin.x + rect.size.height / 18.0 + rect.size.height / 10.0, rect.origin.y), transformRotate60);
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, centerTopLeft.x , centerTopLeft.y);
    CGContextRotateCTM(context, M_PI / 6.0);
    CGPoint starPoints[10];
    KCPointsOfStar(rect.origin, rect.size.height / 18.0, starPoints);
    CGContextSetFillColorWithColor(context, [yellowColor CGColor]);
    CGContextBeginPath(context);
    CGContextAddLines(context, starPoints, sizeof(starPoints) / sizeof(starPoints[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // draw bottom left star
    CGPoint centerBottomLeft= CGPointMake(centerTopLeft.x, rect.size.height * (1 - 1/18.0 - 1/10.0));
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, centerBottomLeft.x , centerBottomLeft.y);
    CGContextRotateCTM(context, M_PI / 6.0);
    CGPoint starPoints1[10];
    KCPointsOfStar(rect.origin, rect.size.height / 18.0, starPoints1);
    CGContextSetFillColorWithColor(context, [yellowColor CGColor]);
    CGContextBeginPath(context);
    CGContextAddLines(context, starPoints1, sizeof(starPoints1) / sizeof(starPoints1[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // draw right star
    CGPoint centerRightLeft = CGPointMake(rightPoint.x - rect.size.height *( 1/18.0 + 1/10.0), rightPoint.y);
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, centerRightLeft.x , centerRightLeft.y);
    CGContextRotateCTM(context, M_PI / 10.0);
    CGPoint starPoints2[10];
    KCPointsOfStar(rect.origin, rect.size.height / 18.0, starPoints2);
    CGContextSetFillColorWithColor(context, [yellowColor CGColor]);
    CGContextBeginPath(context);
    CGContextAddLines(context, starPoints2, sizeof(starPoints2) / sizeof(starPoints2[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // draw center of Sun
    CGPoint center = CGPointMake(rect.origin.x + rect.size.height * (1/10.0 + 1/9.0 + 1/10.0), rect.origin.y + rect.size.height / 2.0);
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [yellowColor CGColor]);
    CGContextTranslateCTM(context, center.x, center.y);
    CGContextFillEllipseInRect(context, CGRectResize(CGRectZero, CGSizeMake(rect.size.height / 4.5, rect.size.height / 4.5)));
    CGContextRestoreGState(context);
    
    // draw line of vector
    
}

@end
