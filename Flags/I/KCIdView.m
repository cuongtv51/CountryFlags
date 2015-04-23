//
//  KCIdView.m
//  CountryFlags
//
//  Created by ACuong on 3/22/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCIdView.h"

@implementation KCIdView

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context
{
    CGFloat stepHeight = rect.size.height / 2.0;
    // lines colors
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, stepHeight));
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight, rect.size.width, stepHeight));
}

@end
