//
//  SPAppDelegate.h
//  Hypnosister
//
//  Created by Chris Martin on 3/7/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

//forward declaration
@class SPHypnosisView;

@interface SPAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    SPHypnosisView *view;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@end
