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
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    //throw away the style we're given because that's how we roll
    return [self init];
}

- (UIView *)headerView
{
    //if we haven't loaded the view yet...
    if (!headerView) 
    {
        //load it
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return headerView;
}

#pragma mark IBActions
- (IBAction)toggleEditingMode:(id)sender
{
    if ([self isEditing])
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    
    //tableView returns the controllers view
    [[self tableView] reloadData];
}


#pragma mark TableVIewDataSource protocol methods
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [[self headerView] bounds].size.height;
}

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

@end
