//
//  KCThView.m
//  CountryFlags
//
//  Created by ACuong on 3/22/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "KCThView.h"

@implementation KCThView

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context
{
    CGFloat stepHeight = rect.size.height / 6.0;
    // lines colors
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, stepHeight));
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight * 5, rect.size.width, stepHeight));
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight, rect.size.width, stepHeight));
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight * 4, rect.size.width, stepHeight));
    
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + stepHeight * 2, rect.size.width, stepHeight * 2));
}

@end
