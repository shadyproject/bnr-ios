//
//  SPViewController.m
//  Quiz
//
//  Created by Christopher Martin on 11/24/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        [questions addObject:@"What is 4 * 4?"];
        [answers addObject:@"16"];
        
        [questions addObject:@"What is the capital of Oregon?"];
        [answers addObject:@"Salem"];
        
        [questions addObject:@"Who composed the music for the Final Fantasy Series?"];
        [answers addObject:@"Nobuo Uematsu"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBActions
- (IBAction)showQuestion:(id)sender
{
    currentQuestionIndex +=1;
    
    if (currentQuestionIndex == [questions count])
    {
        currentQuestionIndex = 0;
    }
    
    NSString *q = [questions objectAtIndex:currentQuestionIndex];
    
    [questionField setText:q];
    
    NSLog(@"Displaying questions %@", q);
    
    [answerField setText:@"???"];
}

- (IBAction)showAnswer:(id)sender
{
    NSString *a = [answers objectAtIndex:currentQuestionIndex];
    
    [answerField setText:a];
    
    NSLog(@"Showing answers %@", a);
}
@end
