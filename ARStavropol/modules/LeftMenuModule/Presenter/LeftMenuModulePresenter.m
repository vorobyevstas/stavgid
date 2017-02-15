//
//  LeftMenuModuleLeftMenuModulePresenter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModulePresenter.h"

#import "LeftMenuModuleViewInput.h"
#import "LeftMenuModuleInteractorInput.h"
#import "LeftMenuModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation LeftMenuModulePresenter

#pragma mark - Методы LeftMenuModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы LeftMenuModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы LeftMenuModuleViewOutput

- (void) viewWillApear {
    [self.interactor makeMenu];
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
#pragma mark - Методы LeftMenuModuleInteractorOutput
-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
