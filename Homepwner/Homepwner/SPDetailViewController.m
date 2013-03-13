//
//  SPDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 3/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPDetailViewController.h"
#import "SPItem.h"


@implementation SPDetailViewController

@synthesize item;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [nameField setText:item.itemName];
    [serialNumberField setText:item.serialNumber];
    [valueField setText:[NSString stringWithFormat:@"%d", item.valueInDollars]];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateStyle:NSDateFormatterMediumStyle];
    [fmt setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[fmt stringFromDate:item.dateCreated]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    item.itemName = nameField.text;
    item.serialNumber = serialNumberField.text;
    item.valueInDollars = valueField.text.integerValue;
}
@end
