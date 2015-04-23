//
//  KCCommon.m
//  CountryFlags
//
//  Created by ACuong on 3/18/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCCommon.h"
void KCPointsOfStar(CGPoint centerPoint, CGFloat radius, CGPoint points[])
{
    // get center point & other point point
    CGPoint topPoint = CGPointMake(centerPoint.x , centerPoint.y - radius);
    CGFloat rotateAngle = -2.0 * M_PI / 5.0;
    
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(centerPoint.x, centerPoint.y);
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(rotateAngle);
    
    CGAffineTransform customRotation = CGAffineTransformConcat(CGAffineTransformConcat( CGAffineTransformInvert(translateTransform), rotationTransform), translateTransform);
    
    CGPoint leftTopPoint = CGPointApplyAffineTransform(topPoint, customRotation);
    CGPoint leftBottomPoint = CGPointApplyAffineTransform(leftTopPoint, customRotation);
    CGPoint rightBottomPoint = CGPointApplyAffineTransform(leftBottomPoint, customRotation);
    CGPoint rightTopPoint = CGPointApplyAffineTransform(rightBottomPoint, customRotation);
    
    points[0] = topPoint;
    points[1] = CGLinesIntersectAtPoint(CGLineMake(topPoint, leftBottomPoint), CGLineMake(leftTopPoint, rightTopPoint));
    points[2] = leftTopPoint;
    points[3] = CGLinesIntersectAtPoint(CGLineMake(topPoint, leftBottomPoint), CGLineMake(leftTopPoint, rightBottomPoint));
    points[4] = leftBottomPoint;
    points[5] = CGLinesIntersectAtPoint(CGLineMake(leftTopPoint, rightBottomPoint), CGLineMake(rightTopPoint, leftBottomPoint));
    points[6] = rightBottomPoint;
    points[7] = CGLinesIntersectAtPoint(CGLineMake(topPoint, rightBottomPoint), CGLineMake(leftBottomPoint, rightTopPoint));
    points[8] = rightTopPoint;
    points[9] = CGLinesIntersectAtPoint(CGLineMake(topPoint, rightBottomPoint), CGLineMake(leftTopPoint, rightTopPoint));
}

@implementation KCCommon

@end
