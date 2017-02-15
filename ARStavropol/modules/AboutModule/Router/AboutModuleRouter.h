//
//  AboutModuleAboutModuleRouter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AboutModuleRouter : NSObject <AboutModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
