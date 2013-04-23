//
//  SPDetailViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 3/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPItem;

@interface SPDetailViewController : UIViewController
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *dateLabel;
}

@property (nonatomic, strong) SPItem *item;
@end
