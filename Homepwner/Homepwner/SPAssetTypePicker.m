//
//  SPAssetTypePicker.m
//  Homepwner
//
//  Created by Christopher Martin on 9/2/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPAssetTypePicker.h"
#import "SPItem.h"
#import "SPItemStore.h"

NSString * const kSPAssetTypeCellId = @"UITableViewCell-Default";

@implementation SPAssetTypePicker

@synthesize item;

#pragma mark -
#pragma mark Initialization
-(id)init{
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        //todo stuf here
    }
    
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

#pragma mark -
#pragma mark Table View Delegate Stuff
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[SPItemStore sharedStore] allAssetTypes] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSPAssetTypeCellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSPAssetTypeCellId];
    }
    
    NSArray *allAssetTypes = [[SPItemStore sharedStore] allAssetTypes];
    NSManagedObject *assetType = [allAssetTypes objectAtIndex:indexPath.row];
    
    NSString *assetLabel = [assetType valueForKey:@"label"];
    
    cell.textLabel.text = assetLabel;
    
    //add a checkmark if we're the currently selected asset type
    if (assetType == item.assetType) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSArray *allAssetTypes = [[SPItemStore sharedStore] allAssetTypes];
    
    NSManagedObject *assetType = [allAssetTypes objectAtIndex:indexPath.row];
    
    item.assetType = assetType;
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Asset Type Management Methdod
-(IBAction)addNewAssetType:(id)sender{
    DLog(@"Add new asset type here");
}

@end
