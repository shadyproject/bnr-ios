//
//  SPHomepwnerItemCell.h
//  Homepwner
//
//  Created by Christopher Martin on 8/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPHomepwnerItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;

- (IBAction)showImage:(id)sender;
@end
