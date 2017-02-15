//
//  MyMotionManager.h
//  ARStavropol
//
//  Created by apple on 02.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@protocol MyMotionManagerDelegate <NSObject>

@end

@interface MyMotionManager : NSObject

@property (nonatomic, weak) id <MyMotionManagerDelegate> delegate;

@property (strong, nonatomic) CMMotionManager *motionManager;

+ (MyMotionManager *) sharedInstance;
- (void)startMotionManager;
- (void)stopMotionManager;

@end
