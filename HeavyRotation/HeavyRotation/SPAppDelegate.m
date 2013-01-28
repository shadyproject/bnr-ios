//
//  SPAppDelegate.m
//  HeavyRotation
//
//  Created by Christopher Martin on 1/27/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPAppDelegate.h"

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
@end
