//
//  SPAppDelegate.m
//  HeavyRotation
//
//  Created by Christopher Martin on 1/27/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPHeavyViewController.h"

@implementation SPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    UIDevice *device = [UIDevice currentDevice];
    
    [device beginGeneratingDeviceOrientationNotifications];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(orientationChanged:)
               name:UIDeviceOrientationDidChangeNotification object:device];
    
    [nc addObserver:self selector:@selector(proximityChanged:)
               name:UIDeviceProximityStateDidChangeNotification object:device];
    [device setProximityMonitoringEnabled:YES];
    
    SPHeavyViewController *hvc = [[SPHeavyViewController alloc] init];
    [self.window setRootViewController:hvc];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -
#pragma mark Methods
- (void)orientationChanged:(NSNotification *)notification
{
    NSLog(@"Orientation changed; %d", [[notification object] orientation]);
}

- (void)proximityChanged:(NSNotification *)notification
{
    NSLog(@"Proximity change: %@", ([notification.object proximityState] ? @"Close" : @"Far"));
}
@end
