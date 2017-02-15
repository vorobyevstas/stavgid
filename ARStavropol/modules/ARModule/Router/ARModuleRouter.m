//
//  ARModuleARModuleRouter.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleRouter.h"
#import "DescriptionModuleModuleInput.h"
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@implementation ARModuleRouter

#pragma mark - Методы ARModuleRouterInput

- (void)goBack {
    [self.transitionHandler closeCurrentModule:YES];
}

- (void)openNewsDetailModuleWithParams:(NSDictionary *)params {
    [[self.transitionHandler openModuleUsingSegue:@"to description"] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<DescriptionModuleModuleInput> moduleInput) {
        [moduleInput configureModule:params];
        return nil;
    }];
}

@end
