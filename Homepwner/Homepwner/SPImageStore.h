//
//  SPImageStore.h
//  Homepwner
//
//  Created by Christopher Martin on 5/28/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (SPImageStore *)sharedStore;

- (void)setImage: (UIImage *)img forKey: (NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
