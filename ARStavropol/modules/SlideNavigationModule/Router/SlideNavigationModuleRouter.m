//
//  SlideNavigationModuleSlideNavigationModuleRouter.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation SlideNavigationModuleRouter

#pragma mark - Методы SlideNavigationModuleRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
