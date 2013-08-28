//
//  SPAppDelegate.m
//  Homepwner
//
//  Created by Christopher Martin on 2/1/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPItemsViewController.h"
#import "SPItemStore.h"
#import "SPItem.h"

@implementation SPAppDelegate

#pragma mark -
#pragma mark Application Delegate Notifications
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    DLog(@"%@", NSStringFromSelector(_cmd));
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    SPItemsViewController *ivc = [[SPItemsViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ivc];
    [self.window setRootViewController:navController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)applicationWillResignActive:(UIApplication *)application{
    DLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)applicationDidEnterBackground:(UIApplication *)application{
    DLog(@"%@", NSStringFromSelector(_cmd));
    
    BOOL success = [[SPItemStore sharedStore] saveChanges];
    
    if (success) {
        DLog(@"Items saved");
    }else{
        DLog(@"Could not save items");
    }
}

-(void)applicationWillEnterForeground:(UIApplication *)application{
    DLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)applicationDidBecomeActive:(UIApplication *)application{
    DLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)applicationWillTerminate:(UIApplication *)application{
    DLog(@"%@", NSStringFromSelector(_cmd));
}

@end
