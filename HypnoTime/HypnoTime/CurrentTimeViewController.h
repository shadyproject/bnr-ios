//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Chris Martin on 3/8/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentTimeViewController : UIViewController
{
    IBOutlet UILabel *timeLabel;
}

- (IBAction)showCurrentTime:(id)sender;

@end
