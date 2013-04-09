//
//  SPChangeDateViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 4/8/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPChangeDateViewController.h"
#import "SPItem.h"

@implementation SPChangeDateViewController

@synthesize item;

#pragma mark -
#pragma mark Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    datePicker.date = item.dateCreated;
}

- (void)viewWillDisappear:(BOOL)animated {
    item.dateCreated = datePicker.date;
}

@end
