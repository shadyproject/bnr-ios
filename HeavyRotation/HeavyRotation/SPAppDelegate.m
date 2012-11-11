//
//  SPAppDelegate.m
//  HeavyRotation
//
//  Created by Chris Martin on 3/19/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPHeavyViewController.h"

@implementation SPAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIDevice *device = [UIDevice currentDevice];
    [device setProximityMonitoringEnabled:YES];
    [device beginGeneratingDeviceOrientationNotifications];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:device];
    [nc addObserver:self selector:@selector(proximityChanged:) name:UIDeviceProximityStateDidChangeNotification object:device];
    
    // Override point for customization after application launch.
    
    SPHeavyViewController *hvc = [[[SPHeavyViewController alloc] init] autorelease];
    [[self window] setRootViewController:hvc];
    
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

#pragma mark Notification center selectors
- (void)orientationChanged:(NSNotification *)note
{
    NSLog(@"Orientation Changed: %d", [[note object] orientation]);
}

- (void)proximityChanged:(NSNotification *)note
{
    BOOL proxState = [[note object] proximityState];
    
    if (proxState) 
    {
        //close to the user
        NSLog(@"Sensor is close to the user");
        [[[[self window] rootViewController] view] setBackgroundColor:[UIColor redColor]];
    }
    else
    {
        NSLog(@"Sensor is far from the user");
        [[[[self window] rootViewController] view] setBackgroundColor:[UIColor whiteColor]];
    }
}

@end
