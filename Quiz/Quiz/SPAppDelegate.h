//
//  SPAppDelegate.h
//  Quiz
//
//  Created by Chris Martin on 12/24/11.
//  Copyright (c) 2011 Software Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPAppDelegate : UIResponder <UIApplicationDelegate>
{
	int currentQuestionIdx;

	//Model Objects
	NSMutableArray *questions;
	NSMutableArray *answers;

	//View Objects
	IBOutlet UILabel *questionField;
	IBOutlet UILabel *answerField;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

#pragma mark Actions
- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@end
