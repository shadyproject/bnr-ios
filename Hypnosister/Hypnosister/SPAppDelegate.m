//
//  SPAppDelegate.m
//  Hypnosister
//
//  Created by Chris Martin on 3/7/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPHypnosisView.h"

@implementation SPAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [view release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //make a rect the size of our window
    CGRect win = [[self window] bounds];
    
    //create a scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:win];
    [[self window] addSubview:scrollView];
    
    //make our view twice as big
    CGRect hugeRect;
    hugeRect.origin = CGPointZero;
    hugeRect.size.width = win.size.width * 2;
    hugeRect.size.height = win.size.height * 2;
    
    [scrollView setContentSize:hugeRect.size];
    
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:10.0];
    [scrollView setDelegate:self];
    
    //center the huge rect in the scroll view
    CGPoint offset;
    offset.x = win.size.width/2.0;
    offset.y = win.size.height/2.0;
   
    [scrollView setContentOffset:offset];
    
    //create an instance of our view
    view = [[SPHypnosisView alloc] initWithFrame:hugeRect];
    [view setBackgroundColor:[UIColor clearColor]];
    [scrollView addSubview:view];
    
    [scrollView release]; //release here because addSubView retains it (i think)
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark UIScrollView delegates
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"scrollViewWillBeginZooming:withView");
}

@end
