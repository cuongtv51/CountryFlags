//
//  KCCommon.h
//  CountryFlags
//
//  Created by ACuong on 3/18/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Array point of star
 *
 *  @param centerPoint
 *  @param radius
 *  @param points   // need allocate with 10 element
 */
void KCPointsOfStar(CGPoint centerPoint, CGFloat radius, CGPoint points[]);

CG_INLINE CGRect CGRectMidleWidth(CGRect rect);
CG_INLINE CGRect CGRectMidleHeight(CGRect rect);
CG_INLINE CGRect CGRectMidleX(CGRect rect);
CG_INLINE CGRect CGRectMidleY(CGRect rect);
CG_INLINE CGRect CGRectMidleTop(CGRect rect);
CG_INLINE CGRect CGRectMidleBottom(CGRect rect);
CG_INLINE CGRect CGRectMidleLeft(CGRect rect);
CG_INLINE CGRect CGRectMidleRight(CGRect rect);

CG_INLINE CGRect CGRectMidleWidth(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y, rect.size.height, rect.size.width / 2);
}

CG_INLINE CGRect CGRectMidleHeight(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y, rect.size.height / 2, rect.size.width);
}

CG_INLINE CGRect CGRectMidleX(CGRect rect)
{
    return CGRectMake(rect.origin.x / 2 , rect.origin.y, rect.size.height, rect.size.width);
}

CG_INLINE CGRect CGRectMidleY(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y / 2, rect.size.height, rect.size.width);
}

CG_INLINE CGRect CGRectMidleTop(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y , rect.size.width , rect.size.height / 2);
}

CG_INLINE CGRect CGRectMidleBottom(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y + rect.size.height / 2, rect.size.width, rect.size.height / 2);
}

CG_INLINE CGRect CGRectMidleLeft(CGRect rect)
{
    return CGRectMake(rect.origin.x , rect.origin.y , rect.size.width / 2, rect.size.height);
}

CG_INLINE CGRect CGRectMidleRight(CGRect rect)
{
    return CGRectMake(rect.origin.x + rect.size.width / 2, rect.origin.y, rect.size.width / 2 , rect.size.height);
}

@interface KCCommon : NSObject

@end
