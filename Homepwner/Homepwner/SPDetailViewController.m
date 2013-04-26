//
//  SPDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 3/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPDetailViewController.h"
#import "SPItem.h"


@implementation SPDetailViewController

@synthesize item;

#pragma mark -
#pragma mark Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [nameField setText:item.itemName];
    [serialNumberField setText:item.serialNumber];
    [valueField setText:[NSString stringWithFormat:@"%d", item.valueInDollars]];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateStyle:NSDateFormatterMediumStyle];
    [fmt setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[fmt stringFromDate:item.dateCreated]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    item.itemName = nameField.text;
    item.serialNumber = serialNumberField.text;
    item.valueInDollars = valueField.text.integerValue;
}

#pragma mark -
#pragma mark IBActions
- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imgPicker setDelegate:self];
    [self presentViewController:imgPicker animated:YES completion:nil];
}

#pragma mark -
#pragma mark ImagePicker Delegates
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    imageView.image = img;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
