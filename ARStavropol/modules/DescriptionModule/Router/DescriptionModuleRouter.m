//
//  DescriptionModuleDescriptionModuleRouter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleRouter.h"

//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation DescriptionModuleRouter

#pragma mark - Методы DescriptionModuleRouterInput
-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
