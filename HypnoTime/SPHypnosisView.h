//
//  SPHypnosisView.h
//  Hypnosister
//
//  Created by Chris Martin on 3/7/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPHypnosisView : UIView
{
    float xShift;
    float yShift;
    UIColor *stripeColor;
}

@property (nonatomic, assign) float xShift;
@property (nonatomic, assign) float yShift;

@end
