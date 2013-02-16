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

- (UIView *)headerView {
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return headerView;
}

#pragma mark -
#pragma mark IBActions
- (IBAction)toggleEditingMode:(id)sender {
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewItem:(id)sender {
    SPItem *item = [[SPItemStore sharedStore] createItem];
    
    int lastRow = [[[SPItemStore sharedStore] allItems] indexOfObject:item];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                            withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self headerView].bounds.size.height;
}

- (NSString *)tableView:(UITableView *)tv titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)ip {
    return @"Remove";
}

#pragma mark -
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return [[SPItemStore sharedStore] allItems].count + 1; //account for our fixed row
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell-Default"];
    
    if (!cell) {
        cell =
            [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell-Default"];
    }
    
    if (indexPath.row >= [[SPItemStore sharedStore] allItems].count) {
        cell.textLabel.text = @"No More Rows!";
    } else {
        SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
        cell.textLabel.text = [item description];
    }
    
   
    return cell;
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)ip {
    if (style == UITableViewCellEditingStyleDelete) {
        SPItemStore *store = [SPItemStore sharedStore];
        NSArray *items = [store allItems];
        SPItem *item = [items objectAtIndex:ip.row];
        
        [store removeItem:item];
        
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tv moveRowAtIndexPath:(NSIndexPath *)srcIp toIndexPath:(NSIndexPath *)dstIp {
    [[SPItemStore sharedStore] moveItemAtIndex:srcIp.row toIndex:dstIp.row];
}

#pragma mark -
#pragma mark Overrides
- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}
@end
