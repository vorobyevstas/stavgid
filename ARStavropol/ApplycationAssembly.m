//
//  ApplycationAssembly.m
//  worldCore
//
//  Created by Maxim Gall on 30.03.16.
//  Copyright © 2016 Maxim Gall. All rights reserved.
//

#import "ApplycationAssembly.h"
#import "AppDelegate.h"

@interface ApplycationAssembly ()

@end

@implementation ApplycationAssembly
- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition) {
//                               [definition injectProperty:@selector(firstViewController) with:[self firstViewController]];
                              [definition injectProperty:@selector(mapController) with:[self mapViewController]];
                              [definition injectProperty:@selector(placeController) with:[self placeViewController]];
                              [definition injectProperty:@selector(aboutController) with:[self aboutViewController]];
                        }];
}

- (SlideNavigationController *) firstViewController {
    
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                            [factoryMethod injectParameterWith:@"SlideNavigationModuleViewController"];
                                        }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                    }];
//    return [TyphoonFactoryDefinition withFactory:[self mainStoryboard]
//                                         selector:@selector(instantiateViewControllerWithIdentifier:)
//                                       parameters:^(TyphoonMethod *factoryMethod) {
//                                            [factoryMethod injectParameterWith:@"SlideNavigationModuleViewController"];
//                                    
//                                        } configuration:^(TyphoonFactoryDefinition *definition) {
//                                        }];
}

- (UIViewController *)mapViewController {
    
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"ARModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
    
//    return [TyphoonFactoryDefinition withFactory:[self mainStoryboard]
//                                        selector:@selector(instantiateViewControllerWithIdentifier:)
//                                      parameters:^(TyphoonMethod *factoryMethod) {
//                                          [factoryMethod injectParameterWith:@"ARModuleViewController"];
//                                          
//                                      } configuration:^(TyphoonFactoryDefinition *definition) {
//                                      }];
}

- (UIViewController *)placeViewController {
    
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"PlaceModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
//    return [TyphoonFactoryDefinition withFactory:[self mainStoryboard]
//                                        selector:@selector(instantiateViewControllerWithIdentifier:)
//                                      parameters:^(TyphoonMethod *factoryMethod) {
//                                          [factoryMethod injectParameterWith:@"PlaceModuleViewController"];
//                                          
//                                      } configuration:^(TyphoonFactoryDefinition *definition) {
//                                      }];
}

- (UIViewController *)aboutViewController {
    return [TyphoonStoryboardDefinition withFactory:[self mainStoryboard]
                                           selector:@selector(instantiateViewControllerWithIdentifier:)
                                         parameters:^(TyphoonMethod *factoryMethod) {
                                             [factoryMethod injectParameterWith:@"AboutModuleViewController"];
                                         }
                                      configuration:^(TyphoonFactoryDefinition *definition) {
                                      }];
//    return [TyphoonFactoryDefinition withFactory:[self mainStoryboard]
//                                        selector:@selector(instantiateViewControllerWithIdentifier:)
//                                      parameters:^(TyphoonMethod *factoryMethod) {
//                                          [factoryMethod injectParameterWith:@"AboutModuleViewController"];
//                                          
//                                      } configuration:^(TyphoonFactoryDefinition *definition) {
//                                      }];
}

- (UIStoryboard*)mainStoryboard {
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

@end
