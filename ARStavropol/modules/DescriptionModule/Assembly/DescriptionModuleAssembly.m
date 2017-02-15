//
//  DescriptionModuleDescriptionModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleAssembly.h"

#import "DescriptionModuleViewController.h"
#import "DescriptionModuleInteractor.h"
#import "DescriptionModulePresenter.h"
#import "DescriptionModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation DescriptionModuleAssembly

- (DescriptionModuleViewController *)viewDescriptionModuleModule {
    return [TyphoonDefinition withClass:[DescriptionModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDescriptionModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterDescriptionModuleModule]];
                          }];
}

- (DescriptionModuleInteractor *)interactorDescriptionModuleModule {
    return [TyphoonDefinition withClass:[DescriptionModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDescriptionModuleModule]];
                          }];
}

- (DescriptionModulePresenter *)presenterDescriptionModuleModule {
    return [TyphoonDefinition withClass:[DescriptionModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewDescriptionModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorDescriptionModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerDescriptionModuleModule]];

                          }];
}

- (DescriptionModuleRouter *)routerDescriptionModuleModule {
    return [TyphoonDefinition withClass:[DescriptionModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewDescriptionModuleModule]];
                          }];
}

@end
