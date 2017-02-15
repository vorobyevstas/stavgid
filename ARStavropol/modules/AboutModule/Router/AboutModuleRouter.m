//
//  AboutModuleAboutModuleRouter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation AboutModuleRouter

#pragma mark - Методы AboutModuleRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
