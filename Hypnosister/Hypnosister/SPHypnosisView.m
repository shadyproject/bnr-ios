//
//  SPHypnosisView.m
//  Hypnosister
//
//  Created by Chris Martin on 3/7/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPHypnosisView.h"

@implementation SPHypnosisView

- (void)drawRect:(CGRect)rect
{
    //get the rect we'll be drawing in
    CGRect bounds = [self bounds];
    
    //grab the center
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //calculate the radius
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //grab a reference to our graphics context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //draw 10 point lines
    CGContextSetLineWidth(context, 10.0);
    
    
    srandom(time(NULL));
    
    CGFloat hue;
    
    //draw concentric circles from the outside in
    for (float currRadius = maxRadius; currRadius > 0; currRadius -= 20) 
    {
        /* 
        float r = (float)random()/RAND_MAX;
        float g = (float)random()/RAND_MAX;
        float b = (float)random()/RAND_MAX;
        
        NSLog(@"Making color with r:%f g:%f b:%f", r, g, b);
        
        [[UIColor colorWithRed:r green:g blue:b alpha:1] setStroke];
         */
        
        //color with hue
        hue = currRadius / maxRadius;
        [[UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0]setStroke];
        
        CGContextAddArc(context, center.x, center.y, currRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    NSString *msg = @"All Glory to the Hypnotoad!";
    
    UIFont *fnt = [UIFont boldSystemFontOfSize:28.0];
    
    //Draw it
    CGRect txtRect;
    txtRect.size = [msg sizeWithFont:fnt];
    txtRect.origin.x = center.x - (txtRect.size.width / 2.0);
    txtRect.origin.y = center.y - (txtRect.size.height / 2.0);
    
    [[UIColor blueColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [msg drawInRect:txtRect withFont:fnt];
}

@end
