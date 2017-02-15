//
//  ARModuleARModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleInteractor.h"

#import "ARModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "ARModuleCellPresenter.h"

@interface ARModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation ARModuleInteractor

#pragma mark - Методы ARModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}

- (void)getPlaces {
    [self.mainService getAll:^(){
        [self getPlacesFromDB];
    }];
}

- (void)getPlacesFromDB {
    [self.mainService getPoints:^(NSArray <PointObj *> *points){
        [self.output receivedPoints:points];
    }];
}

- (void)clickInfoWindow:(NSInteger)placeId {
    [self.mainService getPlaceWithId:placeId completed:^(Place *place){
        [self.output showDetailPlace:place];
    }];
}

@end
