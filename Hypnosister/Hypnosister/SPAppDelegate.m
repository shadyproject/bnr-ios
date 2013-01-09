//
//  SPAppDelegate.m
//  Hypnosister
//
//  Created by Christopher Martin on 1/5/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPHypnosisView.h"

@implementation SPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication]
        setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    CGRect screenRect = [self.window bounds];
    
    //make a scrollview the size of the window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [scrollView setMinimumZoomScale:1.0];
    [scrollView setMaximumZoomScale:5.0];
    [scrollView setDelegate:self];
    [self.window addSubview:scrollView];
    
    CGRect bigRect = screenRect;
    
    hypnoView = [[SPHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnoView];
    
    //set the size for the scroll view content
    [scrollView setContentSize:bigRect.size];
    
    BOOL succeeded = [hypnoView becomeFirstResponder];
    
    if (succeeded)
    {
        NSLog(@"Set HypnoView as first responder");
    }
    else
    {
        NSLog(@"Could not set HypnoView as first response");
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark UIScrollViewDelegate methods
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return hypnoView;
}

@end
