//
//  PlaceModulePlaceModuleRouter.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleRouter.h"
#import "DescriptionModuleModuleInput.h"
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation PlaceModuleRouter

#pragma mark - Методы PlaceModuleRouterInput

-(void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

- (void)openNewsDetailModuleWithParams:(NSDictionary *)params {
    [[self.transitionHandler openModuleUsingSegue:@"to description"] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<DescriptionModuleModuleInput> moduleInput) {
        [moduleInput configureModule:params];
        return nil;
    }];
}

@end
