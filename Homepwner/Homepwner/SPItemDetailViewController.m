//
//  SPItemDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPItemDetailViewController.h"
#import "Possession.h"

@interface SPItemDetailViewController ()

@end

@implementation SPItemDetailViewController
@synthesize possession;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //populate our fields
    [_nameField setText:possession.possessionName];
    [_serialField setText:possession.serialNumber];
    [_valueField setText:[NSString stringWithFormat:@"%d", [possession valueInDollars]]];
    
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    
    [_dateLabel setText:[df stringFromDate:possession.dateCreated]];
    
    [[self navigationItem] setTitle:possession.possessionName];
}

- (void)dealloc {
    [possession release];
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
