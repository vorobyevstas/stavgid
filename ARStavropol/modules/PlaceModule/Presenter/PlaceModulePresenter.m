//
//  PlaceModulePlaceModulePresenter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModulePresenter.h"

#import "PlaceModuleViewInput.h"
#import "PlaceModuleInteractorInput.h"
#import "PlaceModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation PlaceModulePresenter

#pragma mark - Методы PlaceModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы PlaceModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы PlaceModuleViewOutput

- (void) viewWillApear {
    [self.interactor getPlaces];
}

- (void) setTableViewManager:(RETableViewManager*)manager {
    [self.interactor setTableViewManager:manager];
}

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)backBtnTap {
    [self.router goBack];
}
#pragma mark - Методы PlaceModuleInteractorOutput

- (void)selectPlace:(Place *)place {
    [self.router openNewsDetailModuleWithParams:@{@"place" : place}];
}

-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
