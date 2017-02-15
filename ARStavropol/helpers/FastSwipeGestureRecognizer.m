//
//  FastSwipeGestureRecognizer.m
//  ecoursnews
//
//  Created by apple on 20.10.16.
//  Copyright © 2016 Vorobyev Stanislav. All rights reserved.
//

#import "FastSwipeGestureRecognizer.h"

@implementation FastSwipeGestureRecognizer

@synthesize firstTouchLocation;
@synthesize firstTouchTime;
@synthesize touchesCount;

-(void)reset {
    [super reset];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.firstTouchLocation = [[touches anyObject] locationInView:self.view];
    self.firstTouchTime = [NSDate timeIntervalSinceReferenceDate];
    self.touchesCount = 1;
    self.state = UIGestureRecognizerStatePossible;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    self.touchesCount++;
    NSLog(@"- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event %li", (long)self.touchesCount);
    if (self.touchesCount >= REQUIRED_TOUCHES) { // wait until we have a few touches before we evaluate the gesture
        CGPoint thisTouchLocation = [[touches anyObject] locationInView:self.view];
        float horizontalRatio = (ABS(thisTouchLocation.x - self.firstTouchLocation.x) / ABS(thisTouchLocation.y - self.firstTouchLocation.y));
        float verticalRatio = 1 / horizontalRatio;
        NSTimeInterval elapsedTime = [NSDate timeIntervalSinceReferenceDate] - self.firstTouchTime;
        NSLog(@"swipe? %f, %f, %f", verticalRatio, horizontalRatio, elapsedTime);
        
        // if we're moving straight enough and fast enough, complete the gesture
//        if (((horizontalRatio > REQUIRED_STRAIGHTNESS)||(verticalRatio > REQUIRED_STRAIGHTNESS))&&(elapsedTime < REQUIRED_TIME)) {
            if (horizontalRatio > REQUIRED_STRAIGHTNESS) {
                self.direction = (thisTouchLocation.x > self.firstTouchLocation.x) ? DirectionRight : DirectionLeft ;
            } else if (verticalRatio > REQUIRED_STRAIGHTNESS) {
                self.direction = (thisTouchLocation.y > self.firstTouchLocation.y) ? DirectionDown : DirectionUp ;
            }
            self.state = UIGestureRecognizerStateRecognized;
//        } else {
//            self.state = UIGestureRecognizerStateFailed;
//        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    if (self.touchesCount < REQUIRED_TOUCHES) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

@end
