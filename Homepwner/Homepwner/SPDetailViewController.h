//
//  SPDetailViewController.h
//  Homepwner
//
//  Created by Christopher Martin on 3/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPItem;

@interface SPDetailViewController : UIViewController
            <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIButton *assetTypeButton;
    
    UIPopoverController *uiPopover;
}

@property (nonatomic, strong) SPItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

-(id)initForNewItem:(BOOL)isNew;

-(IBAction)takePicture:(id)sender;
-(IBAction)backgroundTapped:(id)sender;
-(IBAction)showAssetTypePicker:(id)sender;
@end
