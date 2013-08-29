//
//  SPItemsViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 2/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPDetailViewController.h"

@interface SPItemsViewController : UITableViewController
            <UIPopoverControllerDelegate>
{
    UIPopoverController *imagePopover;
}

- (IBAction)addNewItem:(id)sender;
@end
