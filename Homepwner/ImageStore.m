//
//  ImageStore.m
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *defaultStore = nil;

@implementation ImageStore
 + (id)allocWithZone:(NSZone *)zone
{
    return [self defaultImageStore];
}

+ (ImageStore *)defaultImageStore
{
    if (!defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultStore;
}

- (id)init
{
    if (defaultStore)
    {
        return defaultStore;
    }
    
    self = [super init];
    if (self)
    {
        images = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)release
{
    //no op
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (void)setImage:(UIImage *)img forKey:(NSString *)str
{
    [images setObject:img forKey:str];
}

- (UIImage *)imageForKey:(NSString *)key
{
    return [images objectForKey:key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key)
    {
        return;
    }
    
    [images removeObjectForKey:key];
}
@end
