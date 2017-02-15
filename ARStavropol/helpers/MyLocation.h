//
//  MyLocation.h
//  directory
//
//  Created by apple on 02.06.15.
//  Copyright (c) 2015 SpaceWell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

static float const LAT_LON_FACTOR = 1.33975031663;                      // Used in azimuzh calculation, don't change
static float const VERTICAL_SENS = 960;
static float const H_PIXELS_PER_DEGREE = 14;                            // How many pixels per degree
static float const OVERLAY_VIEW_WIDTH = 360 * H_PIXELS_PER_DEGREE;      // 360 degrees x sensitivity

static int const MAX_VISIBLE_ANNOTATIONS = 500;                           // Do not change, can affect performance
static int const MAX_VERTICAL_LEVELS = 10;                                // Do not change, can affect performance


@protocol MyLocationDelegate <NSObject>

- (void)myLocationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations;

- (void)myLocationManager:(CLLocationManager *)manager didUpdateReloadLocations:(NSArray<CLLocation *> *)locations;

- (void)myLocationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void)myLocationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status;

@end

@interface MyLocation : NSObject <CLLocationManagerDelegate>

@property (nonatomic, weak) id <MyLocationDelegate> delegate;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) CLLocation *userLocation;
@property (strong, nonatomic) CLLocation *reloadLocationPrevious;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property BOOL altitudeSensitive;
@property CLLocationDistance reloadDistanceFilter;
@property CLLocationDistance userDistanceFilter;
@property double heading;
@property NSTimer *reportLocationTimer;
@property NSTimer *locationSearchTimer;
@property NSTimeInterval reportLocationDate;
@property NSTimeInterval locationSearchStartTime;
@property CMAcceleration lastAcceleration;
@property (nonatomic) CLDeviceOrientation orientation;
@property double pitchPrevious;
@property (getter=calculatePitch) double pitch;

+ (MyLocation *)sharedInstance;
- (void)startUpdatingMyLocation;
- (void)stopUpdatingMyLocation;
- (void)stopTracking;
- (double)azimuthFromUserToLocation:(CLLocation *)location;
+ (double)deltaAngle:(double)angle1 angle2:(double)angle2;

@end
