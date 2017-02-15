//
//  ARModuleARModuleInteractorInput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;
@protocol ARModuleInteractorInput <NSObject>

- (void) setTableViewManager:(RETableViewManager*)manager;
- (void)getPlaces;
- (void)getPlacesFromDB;
- (void)clickInfoWindow:(NSInteger)placeId;

@end
