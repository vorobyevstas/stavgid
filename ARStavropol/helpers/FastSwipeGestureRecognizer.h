//
//  FastSwipeGestureRecognizer.h
//  ecoursnews
//
//  Created by apple on 20.10.16.
//  Copyright © 2016 Vorobyev Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

#define REQUIRED_TOUCHES 2
#define REQUIRED_STRAIGHTNESS 3
#define REQUIRED_TIME .1

typedef enum {
    DirectionUp = 0,
    DirectionRight,
    DirectionDown,
    DirectionLeft
} Direction;

@interface FastSwipeGestureRecognizer : UIGestureRecognizer {
    CGPoint firstTouchLocation;
    NSTimeInterval firstTouchTime;
    int touchesCount;
    
    Direction direction;
}

@property (nonatomic) CGPoint firstTouchLocation;
@property (nonatomic) NSTimeInterval firstTouchTime;
@property (nonatomic) int touchesCount;

@property (nonatomic) Direction direction;

@end
