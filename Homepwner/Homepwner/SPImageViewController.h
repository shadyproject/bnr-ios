//
//  SPImageViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 8/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPImageViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImage *image;

@end
