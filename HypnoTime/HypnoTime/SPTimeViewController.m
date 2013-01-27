//
//  SPTimeViewController.m
//  HypnoTime
//
//  Created by Christopher Martin on 1/26/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPTimeViewController.h"

@implementation SPTimeViewController

#pragma Overrides
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        
        tbi.title = @"Time";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"SPTimeViewController loaded view");
}

#pragma IBActions

- (IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setTimeStyle:NSDateFormatterMediumStyle];
    
    self.timeLabel.text = [fmt stringFromDate:now];
}
@end
