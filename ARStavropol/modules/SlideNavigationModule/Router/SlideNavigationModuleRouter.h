//
//  SlideNavigationModuleSlideNavigationModuleRouter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface SlideNavigationModuleRouter : NSObject <SlideNavigationModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
