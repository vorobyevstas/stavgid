//
//  AboutModuleAboutModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleInteractor.h"

#import "AboutModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "AboutModuleCellPresenter.h"

@interface AboutModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation AboutModuleInteractor

#pragma mark - Методы AboutModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}
@end
