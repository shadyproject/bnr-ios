//
//  SPImageStore.m
//  Homepwner
//
//  Created by Christopher Martin on 5/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPImageStore.h"

@implementation SPImageStore

#pragma mark -
#pragma mark Class Methods
+(id)allocWithZone:(NSZone*)zone{
    return [self sharedStore];
}

//todo make this use a dispatch_once for better singleton-ness
+(SPImageStore*)sharedStore{
    static SPImageStore* sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:NULL] init];
    }
    
    return sharedStore;
}

-(id)init{
    self = [super init];
    if (self) {
        dictionary = [@{} mutableCopy];
    }
    
    return self;
}

#pragma mark -
#pragma mark Instance Methods
-(void)setImage:(UIImage *)img forKey:(NSString *)key{
    [dictionary setObject:img forKey:key];
}

-(UIImage*)imageForKey:(NSString *)key{
    return [dictionary objectForKey:key];
}

-(void)deleteImageForKey:(NSString *)key{
    
    if (!key) {
        return;
    }
    
    [dictionary removeObjectForKey:key];
}
@end
