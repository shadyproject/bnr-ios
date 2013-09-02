//
//  SPItem.m
//  Homepwner
//
//  Created by Christopher Martin on 9/1/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItem.h"


@implementation SPItem

@dynamic itemName;
@dynamic serialNumber;
@dynamic valueInDollars;
@dynamic dateCreated;
@dynamic imageKey;
@dynamic thumbnailData;
@dynamic thumbnail;
@dynamic orderingValue;
@dynamic assetType;

-(void)setThumbnailFromImage:(UIImage *)image{
    CGSize origImgSize = [image size];
    
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
    [image drawInRect:projectRect];
    
    UIImage *smallImg = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:smallImg];
    
    NSData *data = UIImagePNGRepresentation(smallImg);
    [self setThumbnailData:data];
    
    UIGraphicsEndImageContext();
}

@end
