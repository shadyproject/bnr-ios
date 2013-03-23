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
#pragma mark IBActions
- (IBAction)addNewItem:(id)sender {
    SPItem *item = [[SPItemStore sharedStore] createItem];
    
    int lastRow = [[[SPItemStore sharedStore] allItems] indexOfObject:item];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                            withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    
    SPDetailViewController *dvc = [[SPDetailViewController alloc] init];
    dvc.item = item;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return [[SPItemStore sharedStore] allItems].count;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"UITableViewCell-Default"];
    
    if (!cell) {
        cell =
            [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell-Default"];
    }
    
    SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item description];
    
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
    
    if (self) {
        [self.navigationItem setTitle:@"Homepwner"];
        
        //create a uibarbutton item
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self action:@selector(addNewItem:)];
        
        [self.navigationItem setRightBarButtonItem:bbi];
        
        [self.navigationItem setLeftBarButtonItem:self.editButtonItem];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}
@end
