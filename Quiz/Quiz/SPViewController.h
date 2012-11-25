//
//  SPViewController.h
//  Quiz
//
//  Created by Christopher Martin on 11/24/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPViewController : UIViewController
{
    int currentQuestionIndex;
    
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end
