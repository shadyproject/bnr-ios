//
//  SPChangeDateViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 4/8/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPItem;

@interface SPChangeDateViewController : UIViewController
{
    __weak IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, strong) SPItem *item;

@end
