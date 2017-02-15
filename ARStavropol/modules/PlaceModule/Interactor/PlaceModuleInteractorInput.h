//
//  PlaceModulePlaceModuleInteractorInput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;
@protocol PlaceModuleInteractorInput <NSObject>

- (void) setTableViewManager:(RETableViewManager*)manager;
- (void)getPlaces;

@end
