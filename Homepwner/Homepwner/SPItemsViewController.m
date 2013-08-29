//
//  SPItemsViewController.m
//  Homepwner
//
//  Created by Christopher Martin on 2/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItemsViewController.h"
#import "SPItem.h"
#import "SPItemStore.h"
#import "SPHomepwnerItemCell.h"
#import "SPImageStore.h"
#import "SPImageViewController.h"

const NSString *kSPTableCellID = @"SPHomepwnerTableCell";

@implementation SPItemsViewController

#pragma mark -
#pragma mark IBActions
- (IBAction)addNewItem:(id)sender {
    SPItem *item = [[SPItemStore sharedStore] createItem];
    
    SPDetailViewController *dvc = [[SPDetailViewController alloc] initForNewItem:YES];
    dvc.item = item;
    
    dvc.dismissBlock = ^{
        [[self tableView] reloadData];
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dvc];
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    [navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    
    SPDetailViewController *dvc = [[SPDetailViewController alloc] initForNewItem:NO];
    dvc.item = item;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return [[SPItemStore sharedStore] allItems].count;
}

-(UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPItem *item = [[[SPItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    
    SPHomepwnerItemCell *cell = [tv dequeueReusableCellWithIdentifier:@"SPHomepwnerItemCell"];
    
    cell.tableView = self.tableView;
    cell.controller = self;
    
    cell.nameLabel.text = item.itemName;
    cell.serialNumberLabel.text = item.serialNumber;
    cell.valueLabel.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
    cell.thumbnailView.image = item.thumbnail;
    
    return cell;
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)ip {
    if (style == UITableViewCellEditingStyleDelete) {
        SPItemStore *store = [SPItemStore sharedStore];
        NSArray *items = [store allItems];
        SPItem *item = [items objectAtIndex:ip.row];
        
        [store removeItem:item];
        
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tv moveRowAtIndexPath:(NSIndexPath *)srcIp toIndexPath:(NSIndexPath *)dstIp {
    [[SPItemStore sharedStore] moveItemAtIndex:srcIp.row toIndex:dstIp.row];
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
#pragma mark Overrides
- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        [self.navigationItem setTitle:@"Homepwner"];
        
        //create a uibarbutton item
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self action:@selector(addNewItem:)];
        
        [self.navigationItem setRightBarButtonItem:bbi];
        
        [self.navigationItem setLeftBarButtonItem:self.editButtonItem];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"SPHomepwnerItemCell" bundle:nil];
    
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"SPHomepwnerItemCell"];
}

#pragma mark -
#pragma mark Instance Methods
-(void)showImage:(id)sender atIndexPath:(NSIndexPath*)ip{
    DLog(@"Asked to show image at imagePath %@", ip);
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        SPItem *item  = [[[SPItemStore sharedStore] allItems] objectAtIndex:ip.row];
        
        NSString *imgKey = item.imageKey;
        
        //don't display anything if no image
        UIImage *img = [[SPImageStore sharedStore] imageForKey:imgKey];
        
        if (!img) {
            return;
        }
        
        CGRect rect = [self.view convertRect:[sender bounds] fromView:sender];
        
        SPImageViewController *ivc = [[SPImageViewController alloc] init];
        ivc.image = img;
        
        //600x600 popover rect
        imagePopover = [[UIPopoverController alloc] initWithContentViewController:ivc];
        imagePopover.delegate = self;
        imagePopover.popoverContentSize = CGSizeMake(600, 600);
        [imagePopover presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

#pragma mark -
#pragma mark Popover Delegate Methods
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    [imagePopover dismissPopoverAnimated:YES];
    imagePopover = nil;
}
@end
