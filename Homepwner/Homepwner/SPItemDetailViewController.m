//
//  SPItemDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPItemDetailViewController.h"

@interface SPItemDetailViewController ()

@end

@implementation SPItemDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)dealloc {
    [_nameField release];
    [_serialField release];
    [_valueField release];
    [_dateLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameField:nil];
    [self setSerialField:nil];
    [self setValueField:nil];
    [self setDateLabel:nil];
    [super viewDidUnload];
}
@end
