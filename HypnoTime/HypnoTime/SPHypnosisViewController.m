//
//  SPHypnosisViewController.m
//  HypnoTime
//
//  Created by Christopher Martin on 1/26/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPHypnosisViewController.h"
#import "SPHypnosisView.h"

@implementation SPHypnosisViewController

#pragma mark Overrides
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSBundle *appBundle = [NSBundle mainBundle];
    
    //explicity find a xib file, if we name the xib file after this controller, we don't need to do this
    self = [super initWithNibName:@"SPTimeViewController" bundle:appBundle];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        
        tbi.title = @"Hypnosis";
    }
    
    return self;
}

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    SPHypnosisView *view = [[SPHypnosisView alloc] initWithFrame:frame];
    
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"SPHypnosisViewController loaded view");
}
@end
