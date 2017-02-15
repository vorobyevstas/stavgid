//
//  ARModuleARModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleAssembly.h"

#import "ARModuleViewController.h"
#import "ARModuleInteractor.h"
#import "ARModulePresenter.h"
#import "ARModuleRouter.h"
#import "mainService.h"
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation ARModuleAssembly

- (ARModuleViewController *)viewARModuleModule {
    return [TyphoonDefinition withClass:[ARModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterARModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterARModuleModule]];
                          }];
}

- (ARModuleInteractor *)interactorARModuleModule {
    return [TyphoonDefinition withClass:[ARModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterARModuleModule]];
                              [definition injectProperty:@selector(mainService)
                                                    with:[self mainServiceARModule]];
                          }];
}

- (ARModulePresenter *)presenterARModuleModule {
    return [TyphoonDefinition withClass:[ARModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewARModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorARModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerARModuleModule]];

                          }];
}

- (ARModuleRouter *)routerARModuleModule {
    return [TyphoonDefinition withClass:[ARModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewARModuleModule]];
                          }];
}

- (mainService *)mainServiceARModule {
    return [TyphoonDefinition withClass:[mainService class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                          }];
}

@end
