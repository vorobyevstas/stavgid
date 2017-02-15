//
//  ARModuleARModulePresenter.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModulePresenter.h"

#import "ARModuleViewInput.h"
#import "ARModuleInteractorInput.h"
#import "ARModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation ARModulePresenter

#pragma mark - Методы ARModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы ARModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы ARModuleViewOutput

- (void)clickInfoWindow:(NSInteger)placeId {
    [self.interactor clickInfoWindow:placeId];
}

- (void)viewWillDisapear {
//    [[MyLocation sharedInstance] stopUpdatingMyLocation];
}

- (void)viewWillApear {
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

#pragma mark - Методы ARModuleInteractorOutput

- (void)showDetailPlace:(Place *)place {
    [self.router openNewsDetailModuleWithParams:@{@"place" : place}];
}

- (void)receivedPoints:(NSArray *)points {
    [self.view receivedPoints:points];
}

-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
