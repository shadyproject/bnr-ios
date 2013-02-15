//
//  SPItemsViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 2/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItemsViewController.h"
#import "SPItem.h"
#import "SPItemStore.h"

@implementation SPItemsViewController
#pragma mark -
#pragma mark UITableViewDataSourceMethods
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    return [[SPItemStore sharedStore] allItems].count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= [[SPItemStore sharedStore] allItems].count) {
        return 44.0;
    } else {
        return 60.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Creating cell for row %d", indexPath.row);
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell-Footer"];
    if (!cell) {
        cell =
            [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"UITableViewCell-Footer"];
    }
    
    if (indexPath.row >= [[SPItemStore sharedStore] allItems].count) {
        cell.textLabel.text = @"No more rows!";
    } else {
        SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
        cell.textLabel.text = [item description];
        cell.textLabel.font = [UIFont fontWithName:cell.textLabel.font.fontName size:20.0];
    }
    
    return cell;
}

#pragma mark -
#pragma mark Overrides
- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        for (int i = 0; i < 5; i += 1) {
            [[SPItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}
@end
