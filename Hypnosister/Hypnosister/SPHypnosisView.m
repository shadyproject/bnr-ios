//
//  SPHypnosisView.m
//  Hypnosister
//
//  Created by Christopher Martin on 1/5/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPHypnosisView.h"

@implementation SPHypnosisView

#pragma mark Synthesizers
@synthesize circleColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    //radius of the circle should be almost as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    CGContextSetLineWidth(context, 10);
    [self.circleColor setStroke];
    
    //draw concentric circles from the outside in
    for (float currentRadius  = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    //draw some text
    NSString *toDraw = @"All glory to the hypnotoad.";
    UIFont *drawFont = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [toDraw sizeWithFont:drawFont];
    
    //center the text
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;
    
    
    //add a drop shadow
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef shadowColor = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, shadowColor);
    
    //draw the text in black
    [[UIColor blackColor] setFill];
    [toDraw drawInRect:textRect withFont:drawFont];
}

@end
