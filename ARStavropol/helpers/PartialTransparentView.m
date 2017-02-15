//
//  PartialTransparentView.m
//  florarea
//
//  Created by apple on 09.07.16.
//  Copyright © 2016 Vorobyev Stanislav. All rights reserved.
//

#import "PartialTransparentView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PartialTransparentView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor*)color andTransparentRects:(CGRect)rect
{
    backgroundColor = color;
    holeRect = rect;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.opaque = NO;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor( context, [UIColor blackColor].CGColor );
//    CGContextFillRect( context, rect );
//    
//    CGRect holeRectIntersection = CGRectIntersection( holeRect, rect );
//    
//    CGContextSetFillColorWithColor( context, [UIColor clearColor].CGColor );
//    CGContextSetBlendMode(context, kCGBlendModeClear);
//    
//    CGContextFillEllipseInRect( context, holeRect );
    
//    // Drawing code
//    [backgroundColor setFill];
//    UIRectFill(rect);
//    
    CGRect holeRectIntersection = CGRectIntersection( holeRect, rect );
    [[UIColor clearColor] setFill];
    UIRectFill(holeRectIntersection);
}

@end
