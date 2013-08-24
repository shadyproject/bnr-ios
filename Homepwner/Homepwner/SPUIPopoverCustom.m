//
//  SPUIPopoverCustom.m
//  Homepwner
//
//  Created by Christopher Martin on 8/23/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPUIPopoverCustom.h"

CGFloat const kArrowWidth = 35.0;
CGFloat const kArrowHeight = 19.0;

CGFloat const kTopContentInset = 8;
CGFloat const kLeftContentInset = 8;
CGFloat const kBottomContentInset = 8;
CGFloat const kRightContentInset = 8;

@implementation SPUIPopoverCustom

@synthesize arrowDirection;
@synthesize arrowOffset;
@synthesize arrowImageView;
@synthesize popoverBackgroundImageView;


#pragma mark -
#pragma mark Overrides
+(CGFloat)arrowBase{
    return kArrowWidth;
}

+(CGFloat)arrowHeight{
    return kArrowHeight;
}

+(UIEdgeInsets)contentViewInsets {
    return UIEdgeInsetsMake(kTopContentInset, kLeftContentInset, kBottomContentInset, kRightContentInset);
}

#pragma mark - Custom setters for updating layout

-(void)setArrowOffset:(CGFloat)offset{
    arrowOffset = offset;
    [self setNeedsLayout];
}

-(void) setArrowDirection:(UIPopoverArrowDirection)direction{
    arrowDirection = direction;
    [self setNeedsLayout];
}

#pragma mark -
#pragma mark Initializers
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        imgTopArrow = [UIImage imageNamed:@"popover-black-top-arrow-image"];
        imgLeftArrow = [UIImage imageNamed:@"popover-black-left-arrow-image"];
        imgBottomArrow = [UIImage imageNamed:@"popover-black-bottom-arrow-image"];
        imgRightArrow = [UIImage imageNamed:@"popover-black-right-arrow-image"];
        
        UIImage *popoverBackgroundImage =
            [[UIImage imageNamed:@"popover-black-bcg-image"] resizableImageWithCapInsets:UIEdgeInsetsMake(49, 46, 49, 45)];
        self.popoverBackgroundImageView = [[UIImageView alloc] initWithImage:popoverBackgroundImage];
        [self addSubview:self.popoverBackgroundImageView];
        
        self.arrowImageView = [[UIImageView alloc] init];
        [self addSubview:self.arrowImageView];
    }
    
    return self;
}

#pragma mark -
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat popoverImageOriginX = 0;
    CGFloat popoverImageOriginY = 0;
    
    CGFloat popoverImageWidth = self.bounds.size.width;
    CGFloat popoverImageHeight = self.bounds.size.height;
    
    CGFloat arrowImageOriginX = 0;
    CGFloat arrowImageOriginY = 0;
    
    CGFloat arrowImageWidth = kArrowWidth;
    CGFloat arrowImageHeight = kArrowHeight;
    
    //radius for rounded corners
    CGFloat cornerRadius = 9;
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            popoverImageOriginY = kArrowHeight - 2;
            popoverImageHeight = self.bounds.size.height - kArrowHeight;
            
            arrowImageOriginX = roundf((self.bounds.size.width - kArrowWidth) / 2 + self.arrowOffset);
            
            arrowImageOriginX = MIN(arrowImageOriginX, self.bounds.size.width - kArrowWidth - cornerRadius);
            arrowImageOriginX = MAX(arrowImageOriginX, cornerRadius);
            
            self.arrowImageView.image = imgTopArrow;
            
            break;
            
        case UIPopoverArrowDirectionDown:
            popoverImageHeight = self.bounds.size.height - kArrowHeight   + 2;
            
            arrowImageOriginX = roundf((self.bounds.size.width - kArrowWidth) / 2 + self.arrowOffset);
            
            arrowImageOriginX = MIN(arrowImageOriginX, self.bounds.size.width - kArrowWidth - cornerRadius);
            arrowImageOriginX = MAX(arrowImageOriginX, cornerRadius);
            
            arrowImageOriginY = popoverImageHeight - 2;
            
            self.arrowImageView.image = imgBottomArrow;
            
            break;
            
        case UIPopoverArrowDirectionLeft:
            popoverImageOriginX = kArrowHeight - 2;
            popoverImageWidth = self.bounds.size.width - kArrowHeight;
            
            arrowImageOriginY = roundf((self.bounds.size.height - kArrowWidth) / 2 + self.arrowOffset);
            
            arrowImageOriginY = MIN(arrowImageOriginY, self.bounds.size.height - kArrowWidth - cornerRadius);
            arrowImageOriginY = MAX(arrowImageOriginY, cornerRadius);
            
            arrowImageWidth = kArrowHeight;
            arrowImageHeight = kArrowWidth;
            
            self.arrowImageView.image = imgLeftArrow;
            
            break;
            
        case UIPopoverArrowDirectionRight:
            popoverImageWidth = self.bounds.size.width - kArrowHeight + 2;
            
            arrowImageOriginX = popoverImageWidth - 2;
            arrowImageOriginY = roundf((self.bounds.size.height - kArrowWidth) / 2 + self.arrowOffset);
            
            arrowImageOriginY = MIN(arrowImageOriginY, self.bounds.size.height - kArrowWidth - cornerRadius);
            arrowImageOriginY = MAX(arrowImageOriginY, cornerRadius);
            
            arrowImageWidth = kArrowHeight;
            arrowImageHeight = kArrowWidth;
            
            self.arrowImageView.image = imgRightArrow;
            
            break;
            
        default:
            popoverImageHeight = self.bounds.size.height - kArrowHeight + 2;
            
            break;
    }
    
    self.popoverBackgroundImageView.frame = CGRectMake(popoverImageOriginX, popoverImageOriginY, popoverImageWidth, popoverImageHeight);
    self.arrowImageView.frame = CGRectMake(arrowImageOriginX, arrowImageOriginY, arrowImageWidth, arrowImageHeight);
}

@end
