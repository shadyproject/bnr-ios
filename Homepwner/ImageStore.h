//
//  ImageStore.h
//  Homepwner
//
//  Created by Christopher Martin on 11/12/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject
{
    NSMutableDictionary *images;
}

+ (ImageStore *)defaultImageStore;

- (void)setImage:(UIImage *)img forKey:(NSString *)str;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
