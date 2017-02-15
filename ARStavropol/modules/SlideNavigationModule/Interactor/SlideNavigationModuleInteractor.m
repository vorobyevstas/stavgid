//
//  SlideNavigationModuleSlideNavigationModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleInteractor.h"

#import "SlideNavigationModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "SlideNavigationModuleCellPresenter.h"

@interface SlideNavigationModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation SlideNavigationModuleInteractor

#pragma mark - Методы SlideNavigationModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}
@end
