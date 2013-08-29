//
//  SPImageViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 8/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPImageViewController.h"

@implementation SPImageViewController

@synthesize image;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGSize s = [self.image size];
    [_scrollView setContentSize:s]; //go go auto-synthesis
    [_imageView setFrame:CGRectMake(0, 0, s.width, s.height)];
    _imageView.image = image;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
