//
//  SPHomepwnerItemCell.m
//  Homepwner
//
//  Created by Christopher Martin on 8/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPHomepwnerItemCell.h"

@implementation SPHomepwnerItemCell

@synthesize tableView;

-(IBAction)showImage:(id)sender{
    DLog(@"User tapped image");
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:self];
    
    NSString *selector = NSStringFromSelector(_cmd);
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    SEL newSelector = NSSelectorFromString(selector);
    
    if (indexPath) {
        if ([self.controller respondsToSelector:newSelector]) {
            [self.controller performSelector:newSelector withObject:sender withObject:indexPath];
        }
    }
    
}
@end
