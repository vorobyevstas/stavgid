//
//  DescriptionModuleDescriptionModuleRouter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface DescriptionModuleRouter : NSObject <DescriptionModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
