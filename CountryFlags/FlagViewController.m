//
//  FlagViewController.m
//  CountryFlags
//
//  Created by ACuong on 4/17/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "FlagViewController.h"

@interface FlagViewController ()

@end

@implementation FlagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = [self.dictInfo objectForKey:@"Name"];
    NSString *className = [self.dictInfo objectForKey:@"Class"];
    UIView *contentView = [[NSClassFromString(className) alloc] initWithFrame:self.view.bounds];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
}
@end
