//
//  PlaceModulePlaceModuleRouter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface PlaceModuleRouter : NSObject <PlaceModuleRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
