//
//  SPItemDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPItemDetailViewController.h"
#import "Possession.h"
#import "ImageStore.h"

@interface SPItemDetailViewController ()

@end

@implementation SPItemDetailViewController
@synthesize possession;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //populate our fields
    [_nameField setText:possession.possessionName];
    [_serialField setText:possession.serialNumber];
    [_valueField setText:[NSString stringWithFormat:@"%d", [possession valueInDollars]]];
    
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterNoStyle];
    
    [_dateLabel setText:[df stringFromDate:possession.dateCreated]];
    
    NSString *imgKey = [possession imageKey];
    
    if (imgKey)
    {
        UIImage *img = [[ImageStore defaultImageStore] imageForKey:imgKey];
        [_imageView setImage:img];
    }
    else
    {
        [_imageView setImage:nil];
    }
    
    
    [[self navigationItem] setTitle:possession.possessionName];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //clear first responder
    [self.view endEditing:YES];
    
    [possession setPossessionName:[_nameField text]];
    [possession setSerialNumber:[_serialField text]];
    [possession setValueInDollars:[[_valueField text] intValue]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [possession release];
    [_nameField release];
    [_serialField release];
    [_valueField release];
    [_dateLabel release];
    [_imageView release];
    [super dealloc];
}
- (void)viewDidUnload {
    possession = nil;
    [self setNameField:nil];
    [self setSerialField:nil];
    [self setValueField:nil];
    [self setDateLabel:nil];
    [self setImageView:nil];
    [super viewDidUnload];
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    //if we have a camera, use it.  otherwise, pick a photo
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [picker setDelegate:self];
    [self presentModalViewController:picker animated:YES];
    
    //the picker will be retained by SPItemViewController until it is dismissed
    [picker release];
}

- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}

- (IBAction)deletePicture:(id)sender
{
    [_imageView setImage:nil];
    [[ImageStore defaultImageStore] deleteImageForKey:possession.imageKey];
    //todo enable/disable the button
}

#pragma mark Image Picker delegates
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *oldKey = [possession imageKey];
    
    //remove the old image if there is one
    if (oldKey) {
        [[ImageStore defaultImageStore] deleteImageForKey:oldKey];
    }
    
    //get the picked image from the dict
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef uniqueId = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uniqueIdString = CFUUIDCreateString(kCFAllocatorDefault, uniqueId);
    
    [possession setImageKey:(NSString *)uniqueIdString];
    
    CFRelease(uniqueId);
    CFRelease(uniqueIdString);
    
    [[ImageStore defaultImageStore] setImage:img forKey:possession.imageKey];
    
    [_imageView setImage:img];
    
    //dismiss the picker
    [self dismissModalViewControllerAnimated:YES];
}
@end
