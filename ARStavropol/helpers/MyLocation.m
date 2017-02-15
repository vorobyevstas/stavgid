//
//  MyLocation.m
//  directory
//
//  Created by apple on 02.06.15.
//  Copyright (c) 2015 SpaceWell. All rights reserved.
//

#import "MyLocation.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@implementation MyLocation

+ (MyLocation *) sharedInstance {
    
    static MyLocation *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MyLocation alloc] init];
    });
    return instance;
}

- (id)init {
    
    self = [super init];
    
    if(self != nil) {
        
        self.locationManager = [CLLocationManager new];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 25;
        self.reloadDistanceFilter = 75;
        self.locationManager.delegate = (id)self;
        [self.locationManager startUpdatingHeading];
        [self.locationManager startUpdatingLocation];
        
        self.motionManager = [CMMotionManager new];
        self.motionManager.accelerometerUpdateInterval = .2;
        self.motionManager.gyroUpdateInterval = .2;
        [self.motionManager startAccelerometerUpdates];
    }
    
    return self;
}

- (void)stopTracking {
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
    [self.motionManager stopAccelerometerUpdates];
}

- (void)ReloadDistanceFilter:(float)reloadDistanceFilter {
    self.reloadDistanceFilter = reloadDistanceFilter;
}

- (void)startUpdatingMyLocation {
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdatingMyLocation {
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - variables

- (CLDeviceOrientation)orientation {
    
    if(_orientation == CLDeviceOrientationUnknown) {
        _orientation = CLDeviceOrientationPortrait;
    }
    
    self.locationManager.headingOrientation = _orientation;
    return _orientation;
}

+ (double)deltaAngle:(double)angle1 angle2:(double)angle2 {
    double deltaAngle = angle1 - angle2;
    
    if(deltaAngle > 180) {
        deltaAngle -= 360;
    } else if(deltaAngle < -180) {
        deltaAngle += 360;
    }
    return deltaAngle;
}

#pragma mark - locationManager delegates

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    self.heading = fmod(newHeading.trueHeading, 360.0);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(self.delegate && [self.delegate respondsToSelector:@selector(myLocationManager:didChangeAuthorizationStatus:)]){
        [self.delegate myLocationManager:manager didChangeAuthorizationStatus:status];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location service error %@", error);
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(myLocationManager:didFailWithError:)]){
        [self.delegate myLocationManager:manager didFailWithError:error];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray*)locations {
    CLLocation *location = [locations lastObject];
    
    NSLog(@"my location lat: %f long: %f",location.coordinate.latitude,location.coordinate.longitude);
    
//    if(self.delegate && [self.delegate respondsToSelector:@selector(myLocationManager:didUpdateLocations:)]){
//        [self.delegate myLocationManager:manager didUpdateLocations:locations];
//    }
    
    if(locations.count > 0) {
        CLLocation *location = locations[0];
        
        // Disregarding old and low quality location detections
        NSInteger age = location.timestamp.timeIntervalSinceNow;
        if(age < -30 || location.horizontalAccuracy > 500 || location.horizontalAccuracy < 0) {
            NSLog(@"Disregarding location: age: \(age), ha: \(location.horizontalAccuracy)");
            return;
        }
        
        [self stopLocationSearchTimer];
        
        self.userLocation = location;
        
        // Setting altitude to 0 if altitudeSensitive == false
        if(self.userLocation != nil && !self.altitudeSensitive) {
            CLLocation *location = self.userLocation;
            self.userLocation = [[CLLocation alloc] initWithCoordinate:location.coordinate altitude:0 horizontalAccuracy:location.horizontalAccuracy verticalAccuracy:location.verticalAccuracy timestamp:location.timestamp];
        }
        
//        if(debugLocation != nil) {
//            self.userLocation = debugLocation;
//        }
        
        if(self.reloadLocationPrevious == nil) {
            self.reloadLocationPrevious = self.userLocation;
        }
        
        //===== Reporting location 5s after we get location, this will filter multiple locations calls and make only one delegate call
        NSTimer *reportIsScheduled = self.reportLocationTimer;// != nil
        
        // First time, reporting immediately
        if(self.reportLocationDate == 0) {
            [self reportLocationToDelegate];
        }
        // Report is already scheduled, doing nothing, it will report last location delivered in that 5s
        else if(reportIsScheduled) {
            
        }
        // Scheduling report in 5s
        else
        {
            self.reportLocationTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(reportLocationToDelegate) userInfo:nil repeats:NO];//Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ARTrackingManager.reportLocationToDelegate), userInfo: nil, repeats: false)
        }
    }
}

- (void)reportLocationToDelegate {
    
    [self.reportLocationTimer invalidate];
    self.reportLocationTimer = nil;
    
    self.reportLocationDate = [[NSDate date] timeIntervalSince1970];
    
    CLLocation *userLocation = self.userLocation;
    CLLocation *reloadLocationPrevious = self.reloadLocationPrevious;
    CLLocationDistance reloadDistanceFilter = self.reloadDistanceFilter;
    
    [self.delegate myLocationManager:self.locationManager didUpdateLocations:@[userLocation]];
    
    if([reloadLocationPrevious distanceFromLocation:userLocation] > reloadDistanceFilter) {
        self.reloadLocationPrevious = userLocation;
        [self.delegate myLocationManager:self.locationManager didUpdateReloadLocations:@[userLocation]];
    }
}

//==========================================================================================================================================================
// MARK:                                                        Calculations
//==========================================================================================================================================================
- (double)calculatePitch {
    if(self.motionManager.accelerometerData == nil) {
        return 0;
    }
    
    CMAcceleration acceleration = self.motionManager.accelerometerData.acceleration;
    
    // Filtering data so its not jumping around
    double filterFactor = 0.05;
    CMAcceleration acc;
    acc.x = (acceleration.x * filterFactor) + (self.lastAcceleration.x  * (1.0 - filterFactor));
    acc.y = (acceleration.y * filterFactor) + (self.lastAcceleration.y  * (1.0 - filterFactor));
    acc.z = (acceleration.z * filterFactor) + (self.lastAcceleration.z  * (1.0 - filterFactor));
    
    self.lastAcceleration = acc;
    
    CLDeviceOrientation deviceOrientation = self.orientation;
    double angle = 0;
    
    if(deviceOrientation == CLDeviceOrientationPortrait) {
        angle = atan2(self.lastAcceleration.y, self.lastAcceleration.z);
    }
    else if(deviceOrientation == CLDeviceOrientationPortraitUpsideDown) {
        angle = atan2(-self.lastAcceleration.y, self.lastAcceleration.z);
    }
    else if(deviceOrientation == CLDeviceOrientationLandscapeLeft) {
        angle = atan2(self.lastAcceleration.x, self.lastAcceleration.z);
    }
    else if(deviceOrientation == CLDeviceOrientationLandscapeRight) {
        angle = atan2(-self.lastAcceleration.x, self.lastAcceleration.z);
    }
    
    angle += M_PI_2;
    angle = (self.pitchPrevious + angle) / 2.0;
    self.pitchPrevious = angle;
    return angle;
}

- (double)azimuthFromUserToLocation:(CLLocation *)location {
    double azimuth = 0;
    if(self.userLocation == nil) {
        return 0;
    }
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    CLLocationCoordinate2D userCoordinate = self.userLocation.coordinate;
    
    // Calculating azimuth
    double latitudeDistance = userCoordinate.latitude - coordinate.latitude;
    double longitudeDistance = userCoordinate.longitude - coordinate.longitude;
    
    // Simplified azimuth calculation
    azimuth = RADIANS_TO_DEGREES(atan2(longitudeDistance, (latitudeDistance * LAT_LON_FACTOR)));// radiansToDegrees(atan2(longitudeDistance, (latitudeDistance * Double(LAT_LON_FACTOR))));
    azimuth += 180.0;
    
    return azimuth;
}

//==========================================================================================================================================================
// MARK:                                                        Location search
//==========================================================================================================================================================

- (void)startLocationSearchTimer:(BOOL)resetStartTime {
    [self stopLocationSearchTimer];
    
    if(resetStartTime) {
        self.locationSearchStartTime = [[NSDate date] timeIntervalSince1970];
    }
    
    self.locationSearchTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(locationSearchTimerTick) userInfo:nil repeats:NO];
    //Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ARTrackingManager.locationSearchTimerTick), userInfo: nil, repeats: false)
    
}

- (void)stopLocationSearchTimer {
    [self.locationSearchTimer invalidate];
    self.locationSearchTimer = nil;
}

- (void)locationSearchTimerTick {
    NSTimeInterval locationSearchStartTime = self.locationSearchStartTime;
    NSTimeInterval elapsedSeconds = [[NSDate date] timeIntervalSince1970] - locationSearchStartTime;
    NSLog(@"did Fail %f", elapsedSeconds);
    
    [self startLocationSearchTimer:NO];
    [self.delegate myLocationManager:self.locationManager didFailWithError:nil];
//    self.delegate?.arTrackingManager?(self, didFailToFindLocationAfter: elapsedSeconds)
}

@end
