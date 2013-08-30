//
//  SPForwardingTableCell.m
//  Homepwner
//
//  Created by Christopher Martin on 8/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPForwardingTableCell.h"

@implementation SPForwardingTableCell

@synthesize controller;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
