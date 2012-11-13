//
//  SPItemsViewController.m
//  Homepwner
//
//  Created by Chris Martin on 3/19/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPItemsViewController.h"
#import "PossessionStore.h"
#import "Possession.h"

@implementation SPItemsViewController


- (id)init 
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self)
    {
        //create a button
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
        
        //set it as the nav bar item
        [[self navigationItem] setRightBarButtonItem:bbi];
        
        //navigation item retains the button, so we can release it
        [bbi release];
        
        //Set the title
        [[self navigationItem] setTitle:@"Homepwner"];
        
        //magic!
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    //throw away the style we're given because that's how we roll
    return [self init];
}

#pragma mark IBActions
- (IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    
    //tableView returns the controllers view
    [[self tableView] reloadData];
}


#pragma mark TableVIewDataSource protocol methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultStore] allPossessions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //check for a reuseable cell
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //create a new cell if we can't find one to resuse
    if (!cell) 
    {
        cell = 
            [[[UITableViewCell alloc] 
              initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:[p description]];
    
    return cell;
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)es forRowAtIndexPath:(NSIndexPath *)ip
{
    if (es == UITableViewCellEditingStyleDelete) 
    {
        PossessionStore *ps = [PossessionStore defaultStore];
        NSArray *all = [ps allPossessions];
        Possession *toRemove = [all objectAtIndex:ip.row];
        
        [ps removePossession:toRemove];
        
        //we also remove the row from the table view with an animation
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:YES];
    }
}

- (void)tableView:(UITableView *)tv moveRowAtIndexPath:(NSIndexPath *)sip toIndexPath:(NSIndexPath *)dip
{
    [[PossessionStore defaultStore] movePossessionAtIndex:sip.row toIndex:dip.row];
}

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPItemDetailViewController *detailViewController = [[[SPItemDetailViewController alloc] init] autorelease];
    
    NSArray *possessions = [[PossessionStore defaultStore] allPossessions];
    
    [detailViewController setPossession:[possessions objectAtIndex:indexPath.row]];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

@end
