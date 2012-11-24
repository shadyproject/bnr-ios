//
//  SPItemDetailViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Possession;

@interface SPItemDetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>

@property (retain, nonatomic) IBOutlet UITextField *nameField;
@property (retain, nonatomic) IBOutlet UITextField *serialField;
@property (retain, nonatomic) IBOutlet UITextField *valueField;
@property (retain, nonatomic) IBOutlet UILabel *dateLabel;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) Possession *possession;
@property (retain, nonatomic) UIPopoverController *popoverController;
- (IBAction)takePicture:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)deletePicture:(id)sender;

@end
