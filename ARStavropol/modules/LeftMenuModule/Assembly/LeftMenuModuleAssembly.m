//
//  LeftMenuModuleLeftMenuModuleAssembly.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleAssembly.h"

#import "LeftMenuModuleViewController.h"
#import "LeftMenuModuleInteractor.h"
#import "LeftMenuModulePresenter.h"
#import "LeftMenuModuleRouter.h"
#import "TyphoonStoryboardDefinition.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"


@implementation LeftMenuModuleAssembly

- (LeftMenuModuleViewController *)viewLeftMenuModuleModule {
    return [TyphoonDefinition withClass:[LeftMenuModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterLeftMenuModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterLeftMenuModuleModule]];
                              [definition injectProperty:@selector(arController) with:[self arController1]];
                              [definition injectProperty:@selector(placeController) with:[self placeController1]];
                              [definition injectProperty:@selector(aboutController) with:[self aboutController1]];
                          }];
}

- (LeftMenuModuleInteractor *)interactorLeftMenuModuleModule {
    return [TyphoonDefinition withClass:[LeftMenuModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterLeftMenuModuleModule]];
                          }];
}

- (LeftMenuModulePresenter *)presenterLeftMenuModuleModule {
    return [TyphoonDefinition withClass:[LeftMenuModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewLeftMenuModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorLeftMenuModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerLeftMenuModuleModule]];

                          }];
}

- (LeftMenuModuleRouter *)routerLeftMenuModuleModule {
    return [TyphoonDefinition withClass:[LeftMenuModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewLeftMenuModuleModule]];
                          }];
}

- (UIStoryboard*)mainStoryboard1 {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"Main"];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

- (UIViewController *) arController1 {
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard1]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"ARModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
}

- (UIViewController *) placeController1 {
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard1]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"PlaceModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
}

- (UIViewController *) aboutController1 {
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard1]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"AboutModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
}

@end
