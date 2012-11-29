//
//  SPContainer.h
//  RandomPossessions
//
//  Created by Christopher Martin on 11/28/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPItem.h"

@interface SPContainer : SPItem
{
    NSMutableArray *subItems;
}

- (void)addSubItem:(SPItem *)item;
- (int)totalValue;
@end
