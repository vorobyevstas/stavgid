//
//  ARModuleARModuleViewController.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "ARModuleViewInput.h"
#import "RETableViewManager.h"
#import "ARAnnotation.h"
#import "ARAnnotationView.h"

//#define SWIFT_SUBCLASS __attribute__((objc_subclassing_restricted))

@protocol ARModuleViewOutput;

@interface ARModuleViewController : UIViewController <ARModuleViewInput, MyLocationDelegate, UIAccelerometerDelegate, GMSMapViewDelegate>

@property (nonatomic, strong) id<ARModuleViewOutput> output;

@property BOOL initialized;
@property (weak, nonatomic) IBOutlet UIView *cameraLayer;
@property (weak, nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property NSArray<ARAnnotation *> *annotations;
@property NSArray<ARAnnotation *> *activeAnnotations;
@property NSArray<ARAnnotationView *> *annotationViews;
@property float degreesPerScreen;


//fileprivate var displayTimer: CADisplayLink?
//fileprivate var cameraLayer: AVCaptureVideoPreviewLayer?    // Will be set in init
@property CADisplayLink *displayTimer;
@property int previosRegion;
@property BOOL shouldReloadAnnotations;
@property BOOL reloadInProgress;
@property int reloadToken;
//fileprivate var reloadLock = NSRecursiveLock()
@property double currentHeading;
@property CLLocation *lastLocation;
@property BOOL didLayoutSubviews;
@property (nonatomic, getter=getMaxVerticalLevel) int maxVerticalLevel;
@property (nonatomic, getter=getMaxVisibleAnnotations) int maxVisibleAnnotations;
@property double maxDistance;
@property double headingSmoothingFactor;

- (void)calculateDistanceAndAzimuthForAnnotations:(BOOL)sort onlyForActiveAnnotations:(BOOL)onlyForActiveAnnotations;

@end
