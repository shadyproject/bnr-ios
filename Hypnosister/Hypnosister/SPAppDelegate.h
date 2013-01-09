//
//  SPAppDelegate.h
//  Hypnosister
//
//  Created by Christopher Martin on 1/5/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPHypnosisView.h"

@interface SPAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    SPHypnosisView *hypnoView;
}
@property (strong, nonatomic) UIWindow *window;

@end
