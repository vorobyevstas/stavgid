//
//  LeftMenuModuleLeftMenuModuleRouter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface LeftMenuModuleRouter : NSObject <LeftMenuModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
