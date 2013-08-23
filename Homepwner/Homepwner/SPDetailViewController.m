//
//  SPDetailViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 3/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPDetailViewController.h"
#import "SPItem.h"
#import "SPImageStore.h"
#import "SPItemStore.h"

@implementation SPDetailViewController

@synthesize item;

#pragma mark -
#pragma mark Initializers
-(id)initForNewItem:(BOOL)isNew{
    self = [super initWithNibName:@"SPDetailViewController" bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem =
                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            
            [self.navigationItem setRightBarButtonItem:doneItem];
            
            UIBarButtonItem *cancelItem =
                [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            
            [self.navigationItem setLeftBarButtonItem:cancelItem];
        }
    }
    
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    @throw [NSException exceptionWithName:@"Wrong Initializer" reason:@"Use initForNewItem" userInfo:nil];
}

#pragma mark -
#pragma mark Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color = nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        color = [UIColor colorWithRed:0.875f green:0.88f blue:0.91f alpha:1];
    } else {
        color = [UIColor groupTableViewBackgroundColor];
    }
    
    [self.view setBackgroundColor:color];
}

- (void)viewWillAppear:(BOOL)animated {
    [nameField setText:item.itemName];
    [serialNumberField setText:item.serialNumber];
    [valueField setText:[NSString stringWithFormat:@"%d", item.valueInDollars]];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateStyle:NSDateFormatterMediumStyle];
    [fmt setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[fmt stringFromDate:item.dateCreated]];
    
    NSString* key = item.imageKey;
    
    if (key) {
        UIImage* img = [[SPImageStore sharedStore] imageForKey:item.imageKey];
        imageView.image = img;
    } else {
        imageView.image = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    item.itemName = nameField.text;
    item.serialNumber = serialNumberField.text;
    item.valueInDollars = valueField.text.integerValue;
}

#pragma mark -
#pragma mark UIViewController Overrides
//note that these only work in 6.0
//the 5.0 and below way of doing this is to override shouldAutorotateToInterfaceOrientation
-(NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}


#pragma mark -
#pragma mark IBActions
- (IBAction)takePicture:(id)sender {
    if ([imgPickerPopover isPopoverVisible]) {
        [imgPickerPopover dismissPopoverAnimated:YES];
        imgPickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        UIImageView* overlayView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlaygraphic.png"]];
        [imgPicker setCameraOverlayView:overlayView];
    } else {
        [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imgPicker setDelegate:self];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        imgPickerPopover = [[UIPopoverController alloc] initWithContentViewController:imgPicker];
        [imgPickerPopover setDelegate:self];
        
        [imgPickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
}

-(IBAction)backgroundTapped:(id)sender{
    [[self view] endEditing:YES];
}

#pragma mark -
#pragma mark UITextFieldDelegate Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark ImagePicker Delegates
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString* oldKey = item.imageKey;
    if (oldKey) {
        [[SPImageStore sharedStore] deleteImageForKey:oldKey];
    }
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef newImageId = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef idString = CFUUIDCreateString(kCFAllocatorDefault, newImageId);
    //hooray for toll free bridging
    NSString* key = (__bridge NSString*)idString;
    
    imageView.image = img;
    item.imageKey = key;
    
    [[SPImageStore sharedStore] setImage:img forKey:item.imageKey];
    
    CFRelease(idString);
    CFRelease(newImageId);
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [imgPickerPopover dismissPopoverAnimated:YES];
        imgPickerPopover = nil;
    }
}

#pragma mark -
#pragma mark Popover Delegates
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    DLog(@"User dismissed popover");
    imgPickerPopover = nil;
}

#pragma mark -
#pragma mark Instance Methods
-(void)save:(id)sender{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel:(id)sender{
    [[SPItemStore sharedStore] removeItem:self.item];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
