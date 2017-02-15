//
//  MyMotionManager.m
//  ARStavropol
//
//  Created by apple on 02.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "MyMotionManager.h"

@implementation MyMotionManager

+ (MyMotionManager *) sharedInstance {
    static MyMotionManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MyMotionManager alloc] init];
    });
    return instance;
}

- (id)init {
    
    self = [super init];
    
    if(self != nil) {
        
        self.motionManager = [CMMotionManager new];
        self.motionManager.accelerometerUpdateInterval = .2;
        self.motionManager.gyroUpdateInterval = .2;
    }
    
    return self;
}


- (void)startMotionManager {
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                                           withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                               
//                                                               NSLog(@"accData %@", accelerometerData);
                                                             if(error){
                                                                 
                                                                 NSLog(@"%@", error);
                                                             }
                                                        }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                                  withHandler:^(CMGyroData *gyroData, NSError *error) {
//                                                      NSLog(@"gyroData %@", gyroData);
                                    }];
}

- (void)stopMotionManager {
    
}

@end
