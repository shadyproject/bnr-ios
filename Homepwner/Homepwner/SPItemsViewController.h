//
//  SPItemsViewController.h
//  Homepwner
//
//  Created by Chris Martin on 3/19/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPItemsViewController : UITableViewController<UITableViewDataSource>
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewPossession:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;
@end
