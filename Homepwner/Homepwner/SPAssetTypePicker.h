//
//  SPAssetTypePicker.h
//  Homepwner
//
//  Created by Christopher Martin on 9/2/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kSPAssetTypeCellId;

@class SPItem;

//todo implement deleting of items
@interface SPAssetTypePicker : UITableViewController

@property (nonatomic, strong) SPItem *item;

-(IBAction)addNewAssetType:(id)sender;

@end
