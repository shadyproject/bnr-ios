//
//  SPItemStepper.m
//  Homepwner
//
//  Created by Christopher Martin on 8/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItemStepper.h"

@implementation SPItemStepper

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(IBAction)updateValue:(id)sender{
    NSIndexPath *path = [self.tableView indexPathForCell:self];
    
    NSString *selector = NSStringFromSelector(_cmd);
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    SEL newSelector = NSSelectorFromString(selector);
    
    if (path) {
        if([self.controller respondsToSelector:newSelector]){
            [self.controller performSelector:newSelector withObject:sender withObject:path];
        }
    }
}

@end
