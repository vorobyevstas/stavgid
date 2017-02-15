//
//  ARAnnotation.h
//  ARStavropol
//
//  Created by apple on 09.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARAnnotation : NSObject

/// Title of annotation
@property NSString *title;
/// Location of annotation
@property CLLocation *location;
/// View for annotation. It is set inside ARViewController after fetching view from dataSource.
@property ARAnnotationView *annotationView;
@property BOOL active;
@property double distanceFromUser;
@property double azimuth;
@property int verticalLevel;

@end
