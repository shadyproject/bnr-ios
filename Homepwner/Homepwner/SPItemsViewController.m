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

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Creating cell for row %d", indexPath.row);
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell-Default"];
    
    if (!cell) {
        cell =
            [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell-Default"];
    }
    
    if (indexPath.row >= [[SPItemStore sharedStore] allItems].count) {
        cell.textLabel.text = @"No more rows!";
    } else {
        
        SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
        cell.textLabel.text = [item description];
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
