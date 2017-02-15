//
//  ARModuleARModuleRouter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface ARModuleRouter : NSObject <ARModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
