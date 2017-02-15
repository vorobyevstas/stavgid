//
//  LeftMenuModuleLeftMenuModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleInteractorInput.h"


@protocol LeftMenuModuleInteractorOutput;

@interface LeftMenuModuleInteractor : NSObject <LeftMenuModuleInteractorInput>

@property (nonatomic, weak) id<LeftMenuModuleInteractorOutput> output;

@end
