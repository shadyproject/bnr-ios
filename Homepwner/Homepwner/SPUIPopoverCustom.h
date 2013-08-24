//
//  SPUIPopoverCustom.h
//  Homepwner
//
//  Created by Christopher Martin on 8/23/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIPopoverBackgroundView.h>

@interface SPUIPopoverCustom : UIPopoverBackgroundView
{
    UIImage *imgTopArrow;
    UIImage *imgLeftArrow;
    UIImage *imgRightArrow;
    UIImage *imgBottomArrow;
}

@property (nonatomic, readwrite) CGFloat arrowOffset;
@property (nonatomic, readwrite) UIPopoverArrowDirection arrowDirection;
@property (nonatomic, readwrite, strong) UIImageView *arrowImageView;
@property (nonatomic, readwrite, strong) UIImageView *popoverBackgroundImageView;

+(CGFloat)arrowHeight;
+(CGFloat)arrowBase;
+(UIEdgeInsets)contentViewInsets;

@end
