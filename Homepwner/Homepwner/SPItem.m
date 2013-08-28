//
//  SPItem.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPItem.h"

@implementation SPItem

#pragma mark Property Synthesizers
@synthesize itemName;
@synthesize serialNumber, valueInDollars, dateCreated;
@synthesize imageKey;
@synthesize thumbnailData, thumbnail;

#pragma mark Class Methods
+(id)randomItem{
    //set up some random adjectives
    NSArray *adjectives = @[@"Spikey", @"Tasty", @"Rough"];
    
    //and now, some nouns
    NSArray *nouns = @[@"Sofa", @"Table", @"Musket"];
    
    //get some random indexes
    NSInteger adjIdx = random() % [adjectives count];
    NSInteger nounIdx = random() % [nouns count];
    
    NSString *randomName =
        [NSString stringWithFormat:@"%@ %@", [adjectives objectAtIndex:adjIdx], [nouns objectAtIndex:nounIdx]];
    
    int randomValue = random() % 100;
    
    NSString *randomSerial = [NSString stringWithFormat:@"%c%c%c%c%c",
                              '0' + rand() % 10,
                              'A' + rand() % 26,
                              '0' + rand() % 10,
                              'A' + rand() % 26,
                              '0' + rand() % 10];
    
    SPItem *item = [[self alloc] initWithName:randomName serialNumber:randomSerial dollarValue:randomValue];
    
    return item;
}

#pragma mark Initializer Implementation
-(id)init{
    return [self initWithName:@"Default Name" serialNumber:@"0" dollarValue:0];
}

-(id)initWithName:(NSString *)name serialNumber:(NSString *)num dollarValue:(int)value{
    self = [super init];
    
    if (self){
        itemName = name;
        serialNumber = num;
        valueInDollars = value;
    
        dateCreated = [NSDate date];
    }
    
    return self;
}

#pragma mark Overrides
-(NSString *)description{
    NSString *desc =[NSString stringWithFormat:@"%@ (%@) Worth %i Created:%@",
                     itemName, serialNumber, valueInDollars, dateCreated];
    return desc;
}

-(void)dealloc{
    DLog(@"Destroyed: %@", self);
}

#pragma mark -
#pragma mark NSCoder Implementation
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:itemName forKey:@"itemName"];
    [aCoder encodeObject:serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:imageKey forKey:@"imageKey"];
    
    [aCoder encodeInt:valueInDollars forKey:@"valueInDollars"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.itemName = [aDecoder decodeObjectForKey:@"itemName"];
        self.serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        self.imageKey = [aDecoder decodeObjectForKey:@"imageKey"];
        self.valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
        
        dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
    }
    
    return self;
}

#pragma mark -
#pragma mark Thumbnail Methods
-(void)setThubmnailDataFromImage:(UIImage *)img{
    CGSize origImgSize = [img size];
    
    CGRect thumbRect = CGRectMake(0, 0, 40, 40);
    
    // figure out a scaling ratio
    float ratio = MAX(thumbRect.size.width/origImgSize.width, thumbRect.size.height/origImgSize.height);
    
    //create a new context for our thumbnail
    UIGraphicsBeginImageContextWithOptions(thumbRect.size, NO, 0.0);
    
    //rounded rect
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:thumbRect cornerRadius:5.0];
    [path addClip];
    
    //center the image
    CGRect projectRect;
    projectRect.size.width = ratio * origImgSize.width;
    projectRect.size.height = ratio * origImgSize.height;
    projectRect.origin.x = (thumbRect.size.width - projectRect.size.width)/2;
    projectRect.origin.y = (thumbRect.size.height - projectRect.size.height)/2;
    
    //draw it in the context
    [img drawInRect:projectRect];
    
    UIImage *smallImg = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:smallImg];
    
    NSData *data = UIImagePNGRepresentation(smallImg);
    [self setThumbnailData:data];
    
    UIGraphicsEndImageContext();
}

-(UIImage *)thumbnail{
    if (!thumbnailData) {
        return nil;
    }
    
    if (!thumbnail) {
        thumbnail = [UIImage imageWithData:thumbnailData];
    }
    
    return thumbnail;
}
@end
