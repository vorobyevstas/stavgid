//
//  SlideNavigationModuleSlideNavigationModulePresenter.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModulePresenter.h"

#import "SlideNavigationModuleViewInput.h"
#import "SlideNavigationModuleInteractorInput.h"
#import "SlideNavigationModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation SlideNavigationModulePresenter

#pragma mark - Методы SlideNavigationModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы SlideNavigationModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы SlideNavigationModuleViewOutput

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
#pragma mark - Методы SlideNavigationModuleInteractorOutput
-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
