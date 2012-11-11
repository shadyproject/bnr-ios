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
    
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[PossessionStore defaultStore] createPossession];
        }
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    //throw away the style we're given because that's how we roll
    return [self init];
}

#pragma mark TableVIewDataSource protocol methods
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Getting count for section %d", section);
    
    switch (section) {
        case 0:
            return [[[PossessionStore defaultStore] possessionsWithValueLessThanOrEqualTo:[NSNumber numberWithInt:50]] count];
            break;
            
        case 1:
            return [[[PossessionStore defaultStore] possessionsWithValueGreaterThan:[NSNumber numberWithInt:50]] count];
            break;
            
        default:
            return [[[PossessionStore defaultStore] allPossessions] count];
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Getting item at index path %@", indexPath);
    
    //check for a reuseable cell
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //create a new cell if we can't find one to resuse
    if (!cell) 
    {
        cell = 
            [[[UITableViewCell alloc] 
              initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    Possession *p;
    
    switch (indexPath.section) 
    {
        case 0:
            p =  [[[PossessionStore defaultStore] 
                   possessionsWithValueLessThanOrEqualTo:[NSNumber numberWithInt:50]] objectAtIndex:indexPath.row];
            break;
            
        case 1:
            p = [[[PossessionStore defaultStore] 
                  possessionsWithValueGreaterThan:[NSNumber numberWithInt:50]] objectAtIndex:indexPath.row];
            break;
            
        default:
            p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:indexPath.row];
            break;
    }
    
    [[cell textLabel] setText:[p description]];    

    
    return cell;
}
@end
