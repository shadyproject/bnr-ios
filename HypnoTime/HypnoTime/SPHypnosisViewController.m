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

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    SPHypnosisView *view = [[SPHypnosisView alloc] initWithFrame:frame];
    
    self.view = view;
}
@end
