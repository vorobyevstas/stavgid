//
//  PlaceModulePlaceModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleAssembly.h"

#import "PlaceModuleViewController.h"
#import "PlaceModuleInteractor.h"
#import "PlaceModulePresenter.h"
#import "PlaceModuleRouter.h"
#import "mainService.h"
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation PlaceModuleAssembly

- (PlaceModuleViewController *)viewPlaceModuleModule {
    return [TyphoonDefinition withClass:[PlaceModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPlaceModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterPlaceModuleModule]];
                          }];
}

- (PlaceModuleInteractor *)interactorPlaceModuleModule {
    return [TyphoonDefinition withClass:[PlaceModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPlaceModuleModule]];
                              [definition injectProperty:@selector(mainService)
                                                    with:[self mainServicePlaceModule]];
                          }];
}

- (PlaceModulePresenter *)presenterPlaceModuleModule {
    return [TyphoonDefinition withClass:[PlaceModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewPlaceModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorPlaceModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerPlaceModuleModule]];

                          }];
}

- (PlaceModuleRouter *)routerPlaceModuleModule {
    return [TyphoonDefinition withClass:[PlaceModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewPlaceModuleModule]];
                          }];
}

- (mainService *)mainServicePlaceModule {
    return [TyphoonDefinition withClass:[mainService class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                          }];
}

@end
