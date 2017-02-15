//
//  ARModuleARModuleViewController.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleViewController.h"
#import "Functions.h"
#import "ARModuleTableViewCell.h"
#import "ARModuleViewOutput.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>
#import "infoWindow.h"

@interface ARModuleViewController ()

//@property BOOL shouldReloadAnnotations;

@end

@implementation ARModuleViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

    self.maxVerticalLevel = 5;
    self.maxVisibleAnnotations = 100;
    self.maxDistance = 0;
    
	[self.output didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.headingSmoothingFactor = 0.5f;
    self.maxDistance = 100000;
    self.maxVisibleAnnotations = 30;
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [Functions setupNavigationController:self.navigationController andTitle:@"Ставрополь" andItem:self.navigationItem withLeftBtn:nil andRightBtn:nil];
    
    [MyLocation sharedInstance].delegate = (id)self;
    [[MyLocation sharedInstance] startUpdatingMyLocation];
    
    [[MyMotionManager sharedInstance] startMotionManager];
    
    [self bk_addObserverForKeyPaths:@[@"annotations.@count"] task:^(id obj, NSString *path){
        NSLog(@"annotations change");
    }];
    NSLog(@"lat %f lng %f", [MyLocation sharedInstance].locationManager.location.coordinate.latitude, [MyLocation sharedInstance].locationManager.location.coordinate.longitude);
    
    NSMutableArray *anns = [NSMutableArray new];
    for(int i=0;i<50;i++) {
        ARAnnotation *ann = [ARAnnotation new];
        ann.title = [NSString stringWithFormat:@"point %i", i];
//        ann.location = [self getRandomLocation:45.554833 centerLongitude:41.695433 delta:0.05];
        ann.location = [self getRandomLocation:45.063618 centerLongitude:41.9846098 delta:0.05];
        ARAnnotationView *view = [ARAnnotationView new];
        view.frame = CGRectMake(0, 0, 150, 50);
        view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5f];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        lab.text = ann.title;
        [view addSubview:lab];
        ann.annotationView = view;
        [anns addObject:ann];
    }
    
    [self setAnnotations2:anns];
    
    self.displayTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayTimerTick)];
    [self.displayTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    //self.displayTimer?.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
    
    [self.mapView animateToLocation:[MyLocation sharedInstance].locationManager.location.coordinate];
    [self.mapView animateToZoom:14];
    [self.output viewWillApear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.displayTimer invalidate];
    [self.output viewWillDisapear];
}

- (void)viewDidLayoutSubviews {
    self.degreesPerScreen = (self.view.bounds.size.width / OVERLAY_VIEW_WIDTH) * 360.0;
}

- (void)updateViewConstraints {
    [self.cameraLayer mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.overlayView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.mapView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.segment mas_remakeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view).with.offset(30);
    }];
    
    [super updateViewConstraints];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(IBAction)action:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:1 withCompletion:nil];
    
}

//==========================================================================================================================================================
// MARK:                                    Main logic
//==========================================================================================================================================================

- (CLLocation *)getRandomLocation:(double)centerLatitude centerLongitude:(double)centerLongitude delta:(double)delta {
    double lat = centerLatitude;
    double lon = centerLongitude;
    
    double latDelta = -(delta / 2) + drand48() * delta;
    double lonDelta = -(delta / 2) + drand48() * delta;
    lat = lat + latDelta;
    lon = lon + lonDelta;
    return [[CLLocation alloc] initWithLatitude:lat longitude:lon];
}

- (int)getMaxVerticalLevel {
    if(_maxVerticalLevel > MAX_VERTICAL_LEVELS) {
        _maxVerticalLevel = MAX_VERTICAL_LEVELS;
    }
    return _maxVerticalLevel;
}
/// Total maximum number of visible annotation views. Default value is 100. Max value is 500
- (int)getMaxVisibleAnnotations {
    if(_maxVisibleAnnotations > MAX_VISIBLE_ANNOTATIONS) {
        _maxVisibleAnnotations = MAX_VISIBLE_ANNOTATIONS;
    }
    return _maxVisibleAnnotations;
}

- (void)reload:(BOOL)calculateDistanceAndAzimuth calculateVerticalLevels:(BOOL)calculateVerticalLevels createAnnotationViews:(BOOL)createAnnotationViews {
    NSLog(@"- (void)reload:%i calculateVerticalLevels:%i createAnnotationViews:%i", calculateDistanceAndAzimuth, calculateVerticalLevels, createAnnotationViews);
    if(calculateDistanceAndAzimuth) {
        
        // Sort by distance is needed only if creating new views
        BOOL sort = createAnnotationViews;
        // Calculations for all annotations should be done only when creating annotations views
        BOOL onlyForActiveAnnotations = !createAnnotationViews;
        [self calculateDistanceAndAzimuthForAnnotations:sort onlyForActiveAnnotations:onlyForActiveAnnotations];
    }
    
    if(createAnnotationViews) {
        self.activeAnnotations = [self filteredAnnotations:0 maxVisibleAnnotations:self.maxVisibleAnnotations maxDistance:self.maxDistance];
        [self setInitialVerticalLevels];
    }
    
    if(calculateVerticalLevels) {
        [self calculateVerticalLevels];
    }
    
    if(createAnnotationViews) {
        [self createAnnotationViews];
    }
    
    [self positionAnnotationViews];
    
    // Calling bindUi on every annotation view so it can refresh its content,
    // doing this every time distance changes, in case distance is needed for display.
    if(calculateDistanceAndAzimuth) {
        for(ARAnnotationView *annotationView in self.annotationViews)
        {
            [annotationView bindUi];
        }
    }
    
}

/// Determines which annotations are active and which are inactive. If some of the input parameters is nil, then it won't filter by that parameter.
- (NSArray *)filteredAnnotations:(int)maxVerticalLevel maxVisibleAnnotations:(int)maxVisibleAnnotations maxDistance:(double)maxDistance {
    
    NSMutableArray *nsAnnotations = [NSMutableArray new];
    nsAnnotations = [self.annotations mutableCopy];
    
    NSMutableArray *filteredAnnotations = [NSMutableArray new];
    int count = 0;
    
    int checkMaxVisibleAnnotations = self.maxVisibleAnnotations;
    int checkMaxVerticalLevel = self.maxVerticalLevel;
    double checkMaxDistance = self.maxDistance;
    
    for(ARAnnotation *nsAnnotation in nsAnnotations) {
        ARAnnotation *annotation = nsAnnotation;
        
        // filter by maxVisibleAnnotations
        if(checkMaxVisibleAnnotations && count >= self.maxVisibleAnnotations)
        {
            annotation.active = NO;
            continue;
        }
        
        // filter by maxVerticalLevel and maxDistance
        if((!checkMaxVerticalLevel || annotation.verticalLevel <= self.maxVerticalLevel) && (!checkMaxDistance || self.maxDistance == 0 || annotation.distanceFromUser <= self.maxDistance)) {
            [filteredAnnotations addObject:annotation];
            annotation.active = YES;
            count += 1;
        }
        else
        {
            annotation.active = NO;
        }
    }
    return filteredAnnotations;
}

//==========================================================================================================================================================
// MARK:                                                        Annotations and annotation views
//==========================================================================================================================================================
/**
 *       Sets annotations. Note that annotations with invalid location will be kicked.
 *
 *       - parameter annotations: Annotations
 */
- (void)setAnnotations2:(NSArray<ARAnnotation *> *)annotations {

    NSLog(@"- (void)setAnnotations2:(NSArray<ARAnnotation *> *)annotations");
    NSMutableArray *validAnnotations = [NSMutableArray new];
    // Don't use annotations without valid location
    for(ARAnnotation *annotation in annotations) {
        if(annotation.location != nil && CLLocationCoordinate2DIsValid(annotation.location.coordinate)) {
            [validAnnotations addObject:annotation];
        }
    }
    self.annotations = validAnnotations;
    NSLog(@"annotations %@", self.annotations);
    [self reloadAnnotations];
}

- (NSArray *)getAnnotations {
    return self.annotations;
}

/// Creates annotations views and recalculates all variables(distances, azimuths, vertical levels) if user location is available, else it will reload when it gets user location.
- (void)reloadAnnotations {
    
    NSLog(@"user %@ view %i", [MyLocation sharedInstance].userLocation, self.isViewLoaded);
    if([MyLocation sharedInstance].userLocation != nil && self.isViewLoaded) {
        NSLog(@"if1");
        self.shouldReloadAnnotations = NO;
        [self reload:YES calculateVerticalLevels:YES createAnnotationViews:YES];
    }
    else
    {
        NSLog(@"if2");
        self.shouldReloadAnnotations = YES;
    }
}

/// Creates annotation views. All views are created at once, for active annotations. This reduces lag when rotating.
- (void)createAnnotationViews {
    NSMutableArray *annotationViews = [NSMutableArray new];
    NSArray *activeAnnotations = self.activeAnnotations;  // Which annotations are active is determined by number of properties - distance, vertical level etc.
    
    // Removing existing annotation views
    for(ARAnnotationView *annotationView in self.annotationViews) {
        [annotationView removeFromSuperview];
    }
    
    // Destroy views for inactive anntotations
    for(ARAnnotation *annotation in self.annotations) {
        if(!annotation.active)
        {
            annotation.annotationView = nil;
        }
    }
    
    // Create views for active annotations
    for(ARAnnotation *annotation in activeAnnotations) {
        // Don't create annotation view for annotation that doesn't have valid location. Note: checked before, should remove
        if(annotation.location == nil || !CLLocationCoordinate2DIsValid(annotation.location.coordinate)) {
            continue;
        }
        
        ARAnnotationView *annotationView = [ARAnnotationView new];
        if(annotation.annotationView != nil) {
            annotationView = annotation.annotationView;
        } else {
//            annotationView = self.dataSource?.ar(self, viewForAnnotation: annotation)
        }
        
        if(annotationView != nil) {
            annotation.annotationView = annotationView;
//            annotationView.annotation = annotation;
            [annotationViews addObject:annotationView];
        }
    }
    
    self.annotationViews = annotationViews;
}


- (void)calculateDistanceAndAzimuthForAnnotations:(BOOL)sort onlyForActiveAnnotations:(BOOL)onlyForActiveAnnotations {
    if([MyLocation sharedInstance].userLocation == nil) {
        return;
    }
    
    CLLocation *userLocation = [MyLocation sharedInstance].userLocation;
    NSArray *array = (onlyForActiveAnnotations && self.activeAnnotations.count > 0) ? self.activeAnnotations : self.annotations;
    
    for(ARAnnotation *annotation in array) {
        if(annotation.location == nil)   // This should never happen bcs we remove all annotations with invalid location in setAnnotation
        {
            annotation.distanceFromUser = 0;
            annotation.azimuth = 0;
            continue;
        }
        
        // Distance
        annotation.distanceFromUser = [annotation.location distanceFromLocation:userLocation];
        
        // Azimuth
        float azimuth = [[MyLocation sharedInstance] azimuthFromUserToLocation:annotation.location];
        annotation.azimuth = azimuth;
    }
    
    if(sort) {
        //self.annotations = self.annotations.sorted { $0.distanceFromUser < $1.distanceFromUser }
        
        NSMutableArray *sortedArray = [NSMutableArray new];
        sortedArray = [self.annotations mutableCopy];
        NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"distanceFromUser" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDesc];
        [sortedArray sortUsingDescriptors:sortDescriptors];
        self.annotations = sortedArray;
    }
}

- (void)updateAnnotationsForCurrentHeading {
    //===== Removing views not in viewport, adding those that are. Also removing annotations view vertical level > maxVerticalLevel
    double degreesDelta = self.degreesPerScreen;
    
    for(ARAnnotation *annotation in self.annotations) {
        if(annotation != nil) {
            double delta = [MyLocation deltaAngle:self.currentHeading angle2:annotation.azimuth];

            if(fabs(delta) < degreesDelta && annotation.verticalLevel <= self.maxVerticalLevel) {
                if(annotation.annotationView.superview == nil) {
                    [self.overlayView addSubview:annotation.annotationView];
                }
            }
            else
            {
                if(annotation.annotationView.superview != nil) {
                    [annotation.annotationView removeFromSuperview];
                }
            }
        }
    }
    
    //===== Fix position of annoations near North(critical regions). Explained in xPositionForAnnotationView
    double threshold = 40;
    int currentRegion = 0;
    
    if(self.currentHeading < threshold) // 0-40
    {
        currentRegion = 1;
    }
    else if(self.currentHeading > (360 - threshold))    // 320-360
    {
        currentRegion = -1;
    }
    
    if(currentRegion != self.previosRegion)
    {
        if(self.annotationViews.count > 0)
        {
            // This will just call positionAnnotationViews
            [self reload:NO calculateVerticalLevels:NO createAnnotationViews:NO];
        }
    }
    
    self.previosRegion = currentRegion;
}



- (void)positionAnnotationViews {
    for(ARAnnotation *annotation in self.annotations) {
        float x = [self xPositionForAnnotationView:annotation heading:[MyLocation sharedInstance].heading];
        float y = [self yPositionForAnnotationView:annotation];
        
        annotation.annotationView.frame = CGRectMake(x, y, annotation.annotationView.bounds.size.width, annotation.annotationView.bounds.size.height);
    }
}

- (float)xPositionForAnnotationView:(ARAnnotation *)annotation heading:(double)heading {
//    if(annotationView.annotation == nil) {
//        return 0;
//    }
//    ARAnnotation *annotation;// = annotationView.annotation;
//    NSLog(@"heading %f", heding);
    // Azimuth
    float azimuth = annotation.azimuth;
    
    // Calculating x position
    float xPos = azimuth * H_PIXELS_PER_DEGREE - annotation.annotationView.bounds.size.width / 2.0;
    
    // Fixing position in critical areas (near north).
    // If current heading is right of north(< 40), annotations that are between 320 - 360 wont be visible so we change their position so they are visible.
    // Also if current heading is left of north (320 - 360), annotations that are between 0 - 40 wont be visible so we change their position so they are visible.
    // This is needed because all annotation view are on same ovelay view so views at start and end of overlay view cannot be visible at the same time.
    double threshold = 40;
    if(heading < threshold) {
        if(annotation.azimuth > (360 - threshold)) {
            xPos = -(OVERLAY_VIEW_WIDTH - xPos);
        }
    }
    else if(heading > (360 - threshold)) {
        if(annotation.azimuth < threshold) {
            xPos = OVERLAY_VIEW_WIDTH + xPos;
        }
    }
    
    return xPos;
}

- (float)yPositionForAnnotationView:(ARAnnotation *)annotation {
//    if(annotationView.annotation == nil) {
//        return 0;
//    }
//    ARAnnotation *annotation;// = annotationView.annotation;
    
    float annotationViewHeight = annotation.annotationView.bounds.size.height;
    float yPos = (self.view.bounds.size.height * 0.65) - (annotationViewHeight * (float)annotation.verticalLevel);
    yPos -= powf((float)annotation.verticalLevel, 2) * 4;
    return yPos;
}

- (void)calculateVerticalLevels {
    // Lot faster with NS stuff than swift collection classes
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    // Creating dictionary for each vertical level
    for(int level=0; level <= self.maxVerticalLevel; level++) {
        NSMutableArray *array = [NSMutableArray new];
        [dictionary setObject:array forKey:[NSString stringWithFormat:@"%i", level]];
    }
    
    // Putting each annotation in its dictionary(each level has its own dictionary)
    for(int i=0;i<self.activeAnnotations.count;i++) {
        ARAnnotation *annotation = self.activeAnnotations[i];
        if(annotation.verticalLevel <= self.maxVerticalLevel) {
            NSMutableArray *array = [NSMutableArray new];
            array = [[dictionary objectForKey:[NSString stringWithFormat:@"%i", annotation.verticalLevel]] mutableCopy];
            [array addObject:annotation];
            [dictionary setObject:array forKey:[NSString stringWithFormat:@"%i", annotation.verticalLevel]];
        }
    }
    
    // Calculating annotation view's width in degrees. Assuming all annotation views have same width
    double annotationWidthInDegrees = 0;
    if([self getAnyAnnotationView].bounds.size.width)
    {
        annotationWidthInDegrees = (double)[self getAnyAnnotationView].bounds.size.width / H_PIXELS_PER_DEGREE;
    }
    if(annotationWidthInDegrees < 5) {
        annotationWidthInDegrees = 5;
    }
    
    // Doing the shit
    int minVerticalLevel = INT_MAX;
    for(int level=0; level < self.maxVerticalLevel + 1; level++) {
        NSMutableArray *annotationsForCurrentLevel = [NSMutableArray new];
        annotationsForCurrentLevel = [[dictionary objectForKey:[NSString stringWithFormat:@"%i", level]] mutableCopy];
        NSMutableArray *annotationsForNextLevel = [NSMutableArray new];
        annotationsForNextLevel = [[dictionary objectForKey:[NSString stringWithFormat:@"%i", level + 1]] mutableCopy];
        
        for(int i = 0;i<annotationsForCurrentLevel.count; i++) {
            ARAnnotation *annotation1 = annotationsForCurrentLevel[i];
            if(annotation1.verticalLevel != level) {
                continue;
            }  // Can happen if it was moved to next level by previous annotation, it will be handled in next loop
            
            for(int j=i+1; j<annotationsForCurrentLevel.count;j++) {
                ARAnnotation *annotation2 = annotationsForCurrentLevel[j];
                if(annotation1 == annotation2 || annotation2.verticalLevel != level) {
                    continue;
                }
                
                // Check if views are colliding horizontally. Using azimuth instead of view position in pixel bcs of performance.
                double deltaAzimuth = [MyLocation deltaAngle:annotation1.azimuth angle2:annotation2.azimuth];
                deltaAzimuth = fabs(deltaAzimuth);
                
                if(deltaAzimuth > annotationWidthInDegrees) {
                    // No collision
                    continue;
                }
                
                // Current annotation is farther away from user than comparing annotation, current will be pushed to the next level
                if(annotation1.distanceFromUser > annotation2.distanceFromUser) {
                    annotation1.verticalLevel += 1;
                    if(annotationsForNextLevel != nil) {
                        [annotationsForNextLevel addObject:annotation1];
                    }
                    // Current annotation was moved to next level so no need to continue with this level
                    break;
                }
                // Compared annotation will be pushed to next level because it is furher away
                else
                {
                    annotation2.verticalLevel += 1;
                    if(annotationsForNextLevel != nil)
                    {
                        [annotationsForNextLevel addObject:annotation2];
                    }
                }
            }
            
            if(annotation1.verticalLevel == level) {
                minVerticalLevel = (int)fmin((float)minVerticalLevel, (float)annotation1.verticalLevel);
            }
        }
    }
    
    // Lower all annotation if there is no lower level annotations
    for(ARAnnotation *annotation in self.activeAnnotations) {
        if(annotation.verticalLevel <= self.maxVerticalLevel) {
            annotation.verticalLevel -= minVerticalLevel;
        }
    }
}

/// It is expected that annotations are sorted by distance before this method is called
- (void)setInitialVerticalLevels {
    if(self.activeAnnotations.count == 0) {
        return;
    }
    
    // Fetch annotations filtered by maximumDistance and maximumAnnotationsOnScreen
    NSArray<ARAnnotation *> *activeAnnotations = self.activeAnnotations;
    double minDistance = activeAnnotations[0].distanceFromUser;
    double maxDistance = activeAnnotations[activeAnnotations.count - 1].distanceFromUser;
    if(self.maxDistance > 0) {
        minDistance = 0;
        maxDistance = self.maxDistance;
    }
    double deltaDistance = maxDistance - minDistance;
    double maxLevel = self.maxVerticalLevel;
    
    // First reset vertical levels for all annotations
    for(ARAnnotation *annotation in self.annotations) {
        annotation.verticalLevel = self.maxVerticalLevel + 1;
    }
    if(deltaDistance <= 0) {
        deltaDistance = 1;
    }
    
    // Calculate vertical levels for active annotations
    for(ARAnnotation *annotation in activeAnnotations)
    {
        int verticalLevel = (int)((annotation.distanceFromUser - minDistance) / deltaDistance) * maxLevel;
        annotation.verticalLevel = verticalLevel;
    }
}

- (ARAnnotationView *)getAnyAnnotationView {
    ARAnnotationView *anyAnnotationView = [ARAnnotationView new];
    
    if(self.annotationViews.count) {
        anyAnnotationView = self.annotationViews[0];
    }
    else if(self.activeAnnotations.count) {
        anyAnnotationView = self.activeAnnotations[0].annotationView;// self.dataSource?.ar(self, viewForAnnotation: annotation);
    }
    
    return anyAnnotationView;
}

//==========================================================================================================================================================
// MARK:                                    Events: ARLocationManagerDelegate/Display timer
//==========================================================================================================================================================

- (CGRect)overlayFrame {
    float x = self.view.bounds.size.width / 2 - (self.currentHeading * H_PIXELS_PER_DEGREE);
    float y = ([MyLocation sharedInstance].pitch * VERTICAL_SENS) + 60.0;
    
    CGRect newFrame = CGRectMake(x, y, OVERLAY_VIEW_WIDTH, self.view.bounds.size.height);
    return newFrame;
}

- (void)displayTimerTick {
    double filterFactor = self.headingSmoothingFactor;
    double newHeading = [MyLocation sharedInstance].heading;
//    NSLog(@"head %f", newHeading);
    // Picking up the pace if device is being rotated fast or heading of device is at the border(North). It is needed
    // to do this on North border because overlayView changes its position and we don't want it to animate full circle.
    if(self.headingSmoothingFactor == 1 || fabs(self.currentHeading - [MyLocation sharedInstance].heading) > 20) {
        self.currentHeading = [MyLocation sharedInstance].heading;
    }
    else {
        // Smoothing out heading
        self.currentHeading = (newHeading * filterFactor) + (self.currentHeading  * (1.0 - filterFactor));
    }
//    NSLog(@"head %f", self.currentHeading);
    self.overlayView.frame = [self overlayFrame];
    [self updateAnnotationsForCurrentHeading];
    
//    logText("Heading: \(self.trackingManager.heading)")
}

- (void)myLocationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"locationManager status changed %i", status);
    
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"kCLAuthorizationStatusNotDetermined");
            break;
            
        case kCLAuthorizationStatusRestricted:
            NSLog(@"kCLAuthorizationStatusRestricted");
            break;
            
        case kCLAuthorizationStatusDenied:
            NSLog(@"kCLAuthorizationStatusDenied");
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"kCLAuthorizationStatusAuthorizedAlways");
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"kCLAuthorizationStatusAuthorizedWhenInUse");
            break;
            
        default:
            break;
    }
    
}

- (void)myLocationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"location error %@", error);
}

- (void)myLocationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"location lat: %f long: %f",location.coordinate.latitude,location.coordinate.longitude);
    
    self.lastLocation = manager.location;
    
    // shouldReloadAnnotations will be true if reloadAnnotations was called before location was fetched
    if(self.shouldReloadAnnotations) {
        [self reloadAnnotations];
    }
    // Refresh only if we have annotations
    else if(self.activeAnnotations.count > 0) {
        [self reload:YES calculateVerticalLevels:YES createAnnotationViews:NO];
    }
    
}

- (void)myLocationManager:(CLLocationManager *)manager didUpdateReloadLocations:(NSArray<CLLocation *> *)locations {
    
    [self reloadAnnotations];
//    CLLocation *didUpdateReloadLocation = locations[0];
    NSLog(@"- (void)myLocationManager:(CLLocationManager *)manager didUpdateReloadLocations:(NSArray<CLLocation *> *)locations");
//    // Manual reload?
//    if(didUpdateReloadLocation != nil && self.dataSource != nil && self.dataSource!.responds(to: #selector(ARDataSource.ar(_:shouldReloadWithLocation:))))
//    {
//        let annotations = self.dataSource?.ar?(self, shouldReloadWithLocation: didUpdateReloadLocation!)
//        if let annotations = annotations
//        {
//            setAnnotations(annotations);
//        }
//    }
//    else
//    {
//        self.reloadAnnotations()
//    }
//
}

//internal func arTrackingManager(_ trackingManager: ARTrackingManager, didFailToFindLocationAfter elapsedSeconds: TimeInterval)
//{
//    self.onDidFailToFindLocation?(elapsedSeconds, self.lastLocation != nil)
//}
//

#pragma mark - Методы обработки событий от визуальных элементов
-(void)backBtnTap {
    [self.output backBtnTap];
}

-(void)moreBtnTap {
    
}

- (void)segmentChange {
    if(self.segment.selectedSegmentIndex == 0) {
        self.mapView.hidden = YES;
    }
    else {
        self.mapView.hidden = NO;
    }
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.cameraLayer = [UIFabric viewWithBackgroundColor:[UIColor whiteColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:self.view];
    
    self.overlayView = [UIFabric viewWithBackgroundColor:[UIColor clearColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:self.view];
    
    self.mapView = [UIFabric mapView:self.view];
    self.mapView.delegate = (id)self;
    self.mapView.hidden = YES;
    
    self.segment = [UIFabric SegmentedControlWithButtons:@[@"Камера", @"Карта"] andBackgroundColor:nil andTintColor:[UIColor whiteColor] andTextColor:nil andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:18 andTarget:self andAction:@selector(segmentChange) andSuperView:self.view];
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (videoDevice)
    {
        NSError *error;
        AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
        if (!error)
        {
            if ([session canAddInput:videoInput])
            {
                [session addInput:videoInput];
                AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
                previewLayer.frame = self.view.bounds;
                [self.cameraLayer.layer addSublayer:previewLayer];
                [session startRunning];
            }
        }
    }
}
#pragma mark - Методы ARModuleViewInput

- (void)receivedPoints:(NSArray<PointObj *> *)points {
    
    [self.mapView clear];
    for(int i=0;i<points.count;i++) {
        if(points[i].type == 0) {
            CLLocationCoordinate2D position = CLLocationCoordinate2DMake(points[i].latitude, points[i].longitude);
            GMSMarker *marker = [GMSMarker markerWithPosition:position];
//            marker.title = points[i].name;
            marker.userData = points[i];
            marker.map = self.mapView;
        }
    }
}

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    [self createViewElements];
}

- (void)progressShow {
    [SVProgressHUD show];
}

- (void)progressDismiss {
    [SVProgressHUD dismiss];
}

#pragma mark - MapView delegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {

}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    
    CGPoint point = [mapView.projection pointForCoordinate:marker.position];
    point.y = point.y - 100;
    GMSCameraUpdate *camera = [GMSCameraUpdate setTarget:[mapView.projection coordinateForPoint:point]];
    [mapView animateWithCameraUpdate:camera];
//    showmarker=0;
    mapView.selectedMarker = marker;
    return YES;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    PointObj *point = (PointObj *)marker.userData;
    [self.output clickInfoWindow:point.pointId];
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    
    infoWindow *view = [[infoWindow alloc] initWithFrame:CGRectMake(0, 0, 250*[Functions koefX], 100*[Functions koefX]) withPoint:marker.userData];
    
    return view;
}

@end
