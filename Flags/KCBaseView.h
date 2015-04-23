//
//  KCBaseView.h
//  CountryFlags
//
//  Created by CuongTV on 3/11/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCBaseView : UIView

// Subclass need override
-(void)drawRect: (CGRect)rect inContext:(CGContextRef)context;

// Sale ratio
@property (nonatomic, assign, readonly) CGSize scaleRatio;

@end