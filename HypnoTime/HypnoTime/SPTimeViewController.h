//
//  SPTimeViewController.h
//  HypnoTime
//
//  Created by Christopher Martin on 1/26/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPTimeViewController : UIViewController

@property (weak) IBOutlet UILabel *timeLabel;

- (IBAction)showCurrentTime:(id)sender;
@end
