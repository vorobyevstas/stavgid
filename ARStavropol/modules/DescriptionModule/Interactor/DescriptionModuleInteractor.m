//
//  DescriptionModuleDescriptionModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleInteractor.h"

#import "DescriptionModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "DescriptionModuleCellPresenter.h"

@interface DescriptionModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation DescriptionModuleInteractor

#pragma mark - Методы DescriptionModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}

- (void)showPlace:(Place *)place {
    
    [self.output initPhoto:place.photos];
    
    [self.manager.sections[0] removeAllItems];
    
    DescriptionModuleHeaderCellPresenter *pres = [DescriptionModuleHeaderCellPresenter item];
    pres.model = place.photos;
    pres.interactor = self;
    [self.manager.sections[0] addItem:(id)pres];
    
    DescriptionModuleCellPresenter *pres2 = [DescriptionModuleCellPresenter item];
    pres2.model = place;
    [self.manager.sections[0] addItem:(id)pres2];
    
    [self.manager.sections[0] reloadSectionWithAnimation:UITableViewRowAnimationNone];
}

- (void)openPhoto:(NSInteger)photo {
    [self.output openPhoto:photo];
}

@end
