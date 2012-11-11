//
//  SPAppDelegate.m
//  Quiz
//
//  Created by Chris Martin on 12/24/11.
//  Copyright (c) 2011 Software Developer. All rights reserved.
//

#import "SPAppDelegate.h"

@implementation SPAppDelegate

@synthesize window = _window;

- (id)init
{
	self = [super init];
	if (self) 
	{
		//Create two arrays
		questions = [[NSMutableArray alloc] init];
		answers = [[NSMutableArray alloc] init];

		//add some questions
		[questions addObject:@"What is 2 + 2?"];
		[answers addObject:@"4"];
		
		[questions addObject:@"What is your favorite color?"];
		[answers addObject:@"Blue"];
		
		[questions addObject:@"What is the capital of Oregon?"];
		[answers addObject:@"Salem"];
		
	}

	//return a pointer to self
	return self;
}

- (IBAction)showQuestion:(id)sender
{
	currentQuestionIdx +=1;

	//am I past the last question?
	if (currentQuestionIdx == [questions count]) 
	{
		//go back to the first question
		currentQuestionIdx = 0;
	}

	NSString *question = [questions objectAtIndex:currentQuestionIdx];

	NSLog(@"Displaying question %@", question);

	//display the question in the field
	[questionField setText:question];

	//clear the answer field
	[answerField setText:@"???"];
}

- (IBAction)showAnswer:(id)sender
{
	//get the answer to the current question
	NSString *answer = [answers objectAtIndex:currentQuestionIdx];

	//display it
	[answerField setText:answer];
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];*/
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

@end
