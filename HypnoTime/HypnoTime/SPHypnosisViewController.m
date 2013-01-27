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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
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
@end
