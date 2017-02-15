//
//  LeftMenuModuleLeftMenuModulePresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleViewOutput.h"
#import "LeftMenuModuleInteractorOutput.h"
#import "LeftMenuModuleModuleInput.h"
//#import "BasePresenter.h"

@protocol LeftMenuModuleViewInput;
@protocol LeftMenuModuleInteractorInput;
@protocol LeftMenuModuleRouterInput;

@interface LeftMenuModulePresenter : NSObject <LeftMenuModuleModuleInput, LeftMenuModuleViewOutput, LeftMenuModuleInteractorOutput>

@property (nonatomic, weak) id<LeftMenuModuleViewInput> view;
@property (nonatomic, strong) id<LeftMenuModuleInteractorInput> interactor;
@property (nonatomic, strong) id<LeftMenuModuleRouterInput> router;

@end
