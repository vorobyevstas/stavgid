//
//  LeftMenuModuleLeftMenuModuleRouter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation LeftMenuModuleRouter

#pragma mark - Методы LeftMenuModuleRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
