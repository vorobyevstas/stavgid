//
//  LeftMenuModuleLeftMenuModuleInteractor.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleInteractor.h"

#import "LeftMenuModuleInteractorOutput.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "LeftMenuModuleCellPresenter.h"
#import "MenuModel.h"

@interface LeftMenuModuleInteractor()
@property (weak) RETableViewManager* manager;
@end

@implementation LeftMenuModuleInteractor

#pragma mark - Методы LeftMenuModuleInteractorInput
- (void) setTableViewManager:(RETableViewManager*)manager {
    _manager = manager;
}

- (void)makeMenu {
    
    [self.manager.sections[0] removeAllItems];
    
    LeftMenuModuleHeaderCellPresenter *pres = [LeftMenuModuleHeaderCellPresenter item];
    [self.manager.sections[0] addItem:(id)pres];
    
    LeftMenuModuleCellPresenter *pres2 = [LeftMenuModuleCellPresenter item];
    MenuModel *model = [MenuModel new];
    model.icon = @"person-walking";
    model.name = @"Гид";
    model.isSelected = ([MySingleton sharedMySingleton].menu == 1)?YES:NO;
    pres2.model = model;
    pres2.selectionHandler = ^(LeftMenuModuleCellPresenter *newValue){
        [MySingleton sharedMySingleton].menu = 1;
        [newValue deselectRowAnimated:YES];
    };
    [self.manager.sections[0] addItem:(id)pres2];
    
    pres2 = [LeftMenuModuleCellPresenter item];
    model = [MenuModel new];
    model.icon = @"bank";
    model.name = @"Места";
    model.isSelected = ([MySingleton sharedMySingleton].menu == 1)?YES:NO;
    pres2.model = model;
    pres2.selectionHandler = ^(LeftMenuModuleCellPresenter *newValue){
        [MySingleton sharedMySingleton].menu = 2;
        [newValue deselectRowAnimated:YES];
    };
    [self.manager.sections[0] addItem:(id)pres2];
    
    pres2 = [LeftMenuModuleCellPresenter item];
    model = [MenuModel new];
    model.icon = @"info-sign";
    model.name = @"О нас";
    model.isSelected = ([MySingleton sharedMySingleton].menu == 1)?YES:NO;
    pres2.model = model;
    pres2.selectionHandler = ^(LeftMenuModuleCellPresenter *newValue){
        [MySingleton sharedMySingleton].menu = 3;
        [newValue deselectRowAnimated:YES];
    };
    [self.manager.sections[0] addItem:(id)pres2];
    
    [self.manager.sections[0] reloadSectionWithAnimation:UITableViewRowAnimationNone];
}

@end
