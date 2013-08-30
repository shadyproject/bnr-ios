//
//  SPItemStepper.h
//  Homepwner
//
//  Created by Christopher Martin on 8/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPForwardingTableCell.h"

@interface SPItemStepper : SPForwardingTableCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIStepper *valueStepper;
@property (weak, nonatomic) UITableView *tableView;

-(IBAction)updateValue:(id)sender;

@end
