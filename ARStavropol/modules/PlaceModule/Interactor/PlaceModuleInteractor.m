//
//  PlaceModulePlaceModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleInteractor.h"

#import "PlaceModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "PlaceModuleCellPresenter.h"

@interface PlaceModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation PlaceModuleInteractor

#pragma mark - Методы PlaceModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}

- (void)getPlaces {
    [self.mainService getPlaces:^(NSArray<Place *> *places) {
        [self.manager.sections[0] removeAllItems];
        
        for(Place *place in places) {
            PlaceModuleCellPresenter *pres = [PlaceModuleCellPresenter item];
            pres.model = place;
            pres.selectionHandler = ^(PlaceModuleCellPresenter *newValue){
                [newValue deselectRowAnimated:YES];
                [self.output selectPlace:newValue.model];
            };
            [self.manager.sections[0] addItem:(id)pres];
        }
        
        [self.manager.sections[0] reloadSectionWithAnimation:UITableViewRowAnimationNone];
    }];
}

@end
