//
//  AboutModuleAboutModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleAssembly.h"

#import "AboutModuleViewController.h"
#import "AboutModuleInteractor.h"
#import "AboutModulePresenter.h"
#import "AboutModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation AboutModuleAssembly

- (AboutModuleViewController *)viewAboutModuleModule {
    return [TyphoonDefinition withClass:[AboutModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAboutModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterAboutModuleModule]];
                          }];
}

- (AboutModuleInteractor *)interactorAboutModuleModule {
    return [TyphoonDefinition withClass:[AboutModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAboutModuleModule]];
                          }];
}

- (AboutModulePresenter *)presenterAboutModuleModule {
    return [TyphoonDefinition withClass:[AboutModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewAboutModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorAboutModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerAboutModuleModule]];

                          }];
}

- (AboutModuleRouter *)routerAboutModuleModule {
    return [TyphoonDefinition withClass:[AboutModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewAboutModuleModule]];
                          }];
}

@end
