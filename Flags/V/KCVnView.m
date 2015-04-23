//
//  KCVnView.m
//  CountryFlags
//
//  Created by CuongTV on 3/11/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCVnView.h"

@implementation KCVnView

-(void)drawRect: (CGRect)rect inContext:(CGContextRef)context
{
    // Red background
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, rect);
    
    // get center point & other point point
    CGPoint centerPoint = CGRectCenterPoint(rect);
    CGFloat radius = 3.0 * (rect.size.height / 2.0) / 5.0;
    CGPoint topPoint = CGPointMake(centerPoint.x , centerPoint.y - radius);
    CGFloat rotateAngle = -2.0 * M_PI / 5.0;
 
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(centerPoint.x, centerPoint.y);
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(rotateAngle);
    
    CGAffineTransform customRotation = CGAffineTransformConcat(CGAffineTransformConcat( CGAffineTransformInvert(translateTransform), rotationTransform), translateTransform);
    
    CGPoint leftTopPoint = CGPointApplyAffineTransform(topPoint, customRotation);
    CGPoint leftBottomPoint = CGPointApplyAffineTransform(leftTopPoint, customRotation);
    CGPoint rightBottomPoint = CGPointApplyAffineTransform(leftBottomPoint, customRotation);
    CGPoint rightTopPoint = CGPointApplyAffineTransform(rightBottomPoint, customRotation);
    
    // draw star
    CGPoint rects[] = {
        topPoint,
        CGLinesIntersectAtPoint(CGLineMake(topPoint, leftBottomPoint), CGLineMake(leftTopPoint, rightTopPoint)),
        leftTopPoint,
        CGLinesIntersectAtPoint(CGLineMake(topPoint, leftBottomPoint), CGLineMake(leftTopPoint, rightBottomPoint)),
        leftBottomPoint,
        CGLinesIntersectAtPoint(CGLineMake(leftTopPoint, rightBottomPoint), CGLineMake(rightTopPoint, leftBottomPoint)),
        rightBottomPoint,
        CGLinesIntersectAtPoint(CGLineMake(topPoint, rightBottomPoint), CGLineMake(leftBottomPoint, rightTopPoint)),
        rightTopPoint,
        CGLinesIntersectAtPoint(CGLineMake(topPoint, rightBottomPoint), CGLineMake(leftTopPoint, rightTopPoint))
    };
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextBeginPath(context);
    CGContextAddLines(context, rects, sizeof(rects) / sizeof(rects[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}

@end
