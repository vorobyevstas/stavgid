//
//  AboutModuleAboutModulePresenter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModulePresenter.h"

#import "AboutModuleViewInput.h"
#import "AboutModuleInteractorInput.h"
#import "AboutModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation AboutModulePresenter

#pragma mark - Методы AboutModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы AboutModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы AboutModuleViewOutput

- (void) viewWillApear {
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
#pragma mark - Методы AboutModuleInteractorOutput
-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
