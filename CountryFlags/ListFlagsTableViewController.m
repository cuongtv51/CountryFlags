//
//  ListFlagsTableViewController.m
//  CountryFlags
//
//  Created by ACuong on 4/17/15.
//  Copyright (c) 2015 CuongTV. All rights reserved.
//

#import "ListFlagsTableViewController.h"
#import "FlagViewController.h"

@interface ListFlagsTableViewController () {
    NSDictionary *dictFlags;
    NSArray *keysOrder;
}

@end

@implementation ListFlagsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictFlags = @{@"P": @[@{@"Class": @"KCPhView", @"Name":@"Philippines"}],
                  @"C": @[@{@"Class": @"KCCnView", @"Name":@"China"}],
                  @"I": @[@{@"Class": @"KCIdView", @"Name":@"Indonesia"}],
                  @"T": @[@{@"Class": @"KCThView", @"Name":@"ThaiLand"}],
                  @"L": @[@{@"Class": @"KCLoView", @"Name":@"Laos"}],
                  @"U": @[@{@"Class": @"KCUsView", @"Name":@"United State of America"}],
                  @"V": @[@{@"Class": @"KCVnView", @"Name":@"VietNam"}]
                  };
    keysOrder = [[dictFlags allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    self.title = @"Country Flags";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dictFlags.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *values = [dictFlags objectForKey:[keysOrder objectAtIndex:section]];
    return values.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [keysOrder objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    NSArray *values = [dictFlags objectForKey:[keysOrder objectAtIndex:indexPath.section]];
    NSDictionary *item = [values objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"Name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FlagViewController *flagViewController = [[FlagViewController alloc] initWithNibName:nil bundle:nil];
    NSArray *values = [dictFlags objectForKey:[keysOrder objectAtIndex:indexPath.section]];
    NSDictionary *item = [values objectAtIndex:indexPath.row];
    flagViewController.dictInfo = item;
    [self.navigationController pushViewController:flagViewController animated:YES];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keysOrder;
};

@end
