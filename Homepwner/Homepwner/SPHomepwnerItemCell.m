//
//  SPHomepwnerItemCell.m
//  Homepwner
//
//  Created by Christopher Martin on 8/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPHomepwnerItemCell.h"

@implementation SPHomepwnerItemCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)showImage:(id)sender{
    DLog(@"User tapped image");
}
@end
