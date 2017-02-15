//
//  SlideNavigationModuleSlideNavigationModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleAssembly.h"

#import "SlideNavigationModuleViewController.h"
#import "SlideNavigationModuleInteractor.h"
#import "SlideNavigationModulePresenter.h"
#import "SlideNavigationModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation SlideNavigationModuleAssembly

- (SlideNavigationModuleViewController *)viewSlideNavigationModuleModule {
    return [TyphoonDefinition withClass:[SlideNavigationModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSlideNavigationModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterSlideNavigationModuleModule]];
                          }];
}

- (SlideNavigationModuleInteractor *)interactorSlideNavigationModuleModule {
    return [TyphoonDefinition withClass:[SlideNavigationModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSlideNavigationModuleModule]];
                          }];
}

- (SlideNavigationModulePresenter *)presenterSlideNavigationModuleModule {
    return [TyphoonDefinition withClass:[SlideNavigationModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewSlideNavigationModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorSlideNavigationModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerSlideNavigationModuleModule]];

                          }];
}

- (SlideNavigationModuleRouter *)routerSlideNavigationModuleModule {
    return [TyphoonDefinition withClass:[SlideNavigationModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewSlideNavigationModuleModule]];
                          }];
}

@end
