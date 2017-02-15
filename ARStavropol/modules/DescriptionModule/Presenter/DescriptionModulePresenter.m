//
//  DescriptionModuleDescriptionModulePresenter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModulePresenter.h"

#import "DescriptionModuleViewInput.h"
#import "DescriptionModuleInteractorInput.h"
#import "DescriptionModuleRouterInput.h"
#import "RETableViewManager.h"

@implementation DescriptionModulePresenter

#pragma mark - Методы DescriptionModuleModuleInput

- (void)configureModule:(NSDictionary *)params {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
    self.place = [Place new];
    if([params objectForKey:@"place"]) {
        self.place = [params objectForKey:@"place"];
    }
}

#pragma mark - Методы DescriptionModuleModuleOutput

- (void)setModuleOutput:(id<RamblerViperModuleOutput>)moduleOutput {

}

#pragma mark - Методы DescriptionModuleViewOutput

- (void) viewWillApear {
    [self.interactor showPlace:self.place];
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
#pragma mark - Методы DescriptionModuleInteractorOutput

- (void)initPhoto:(NSArray *)photos {
    [self.view initPhoto:photos];
}

- (void)openPhoto:(NSInteger)photo {
    [self.view openPhoto:photo];
}

-(void) progressShow {
    [self.view progressShow];
}

-(void) progressDismiss {
    [self.view progressDismiss];
}
@end
