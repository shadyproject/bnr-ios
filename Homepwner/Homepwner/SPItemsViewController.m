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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"Value 50 or below";
            break;
            
        case 1:
            return @"Value greater than 50";
            break;
            
        default:
            return @"All Items";
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[SPItemStore sharedStore] itemsWithValueLessThanOrEqualTo:[NSNumber numberWithInt:50]].count;
            break;
            
        case 1:
            return [[SPItemStore sharedStore] itemsWithValueGreaterThan:[NSNumber numberWithInt:50]].count;
            
        default:
            return [[SPItemStore sharedStore] allItems].count;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell-Default"];
    
    if (!cell) {
        cell =
            [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell-Default"];
    }
    
    SPItem *item;
    
    switch (indexPath.section) {
        case 0:
            item = [[[SPItemStore sharedStore]
                  itemsWithValueLessThanOrEqualTo:[NSNumber numberWithInt:50]] objectAtIndex:indexPath.row];
            break;
            
        case 1:
            item = [[[SPItemStore sharedStore]
                  itemsWithValueGreaterThan:[NSNumber numberWithInt:50]] objectAtIndex:indexPath.row];
            break;
            
        default:
            item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
            break;
    }
    
    cell.textLabel.text = [item description];
    
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
