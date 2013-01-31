//
//  SPHeavyViewController.m
//  HeavyRotation
//
//  Created by Christopher Martin on 1/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPHeavyViewController.h"

@implementation SPHeavyViewController

#pragma mark -
#pragma mark Overrides

//note this is deprecated in iOS 6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x
{
    return (x == UIInterfaceOrientationPortrait) || UIInterfaceOrientationIsLandscape(x);
}

@end
