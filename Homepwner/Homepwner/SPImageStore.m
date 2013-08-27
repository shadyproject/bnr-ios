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
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(clearCache:)
               name:UIApplicationDidReceiveMemoryWarningNotification
               object:nil];
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Instance Methods
-(void)setImage:(UIImage *)img forKey:(NSString *)key{
    [dictionary setObject:img forKey:key];
    
    //save the image to the filesytem
    NSString *imgPath = [self imagePathForKey:key];
    NSData *imgData = UIImagePNGRepresentation(img);
    [imgData writeToFile:imgPath atomically:YES];
}

-(UIImage*)imageForKey:(NSString *)key{
    UIImage *img = dictionary[key];
    
    if (!img) {
        img = [UIImage imageWithContentsOfFile:[self imagePathForKey:key]];
        
        if (img) {
            dictionary[key] = img;
        }else{
            DLog(@"Could not find image %@", [self imagePathForKey:key]);
        }
    }
    
    return img;
}

-(void)deleteImageForKey:(NSString *)key{
    if (!key) {
        return;
    }
    
    [dictionary removeObjectForKey:key];
    NSString *imgPath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imgPath error:NULL];
}

-(NSString*)imagePathForKey:(NSString *)key{
    NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                           NSUserDomainMask,
                                                           YES);
    NSString *docDir = docDirs[0];
    
    return [docDir stringByAppendingPathComponent:key];
}

-(void)clearCache:(NSNotification*)notification{
    DLog(@"Flushing image cache of %d objects", dictionary.count);
    [dictionary removeAllObjects];
}
@end
