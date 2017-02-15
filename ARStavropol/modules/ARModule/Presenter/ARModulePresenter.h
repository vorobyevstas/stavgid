//
//  ARModuleARModulePresenter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleViewOutput.h"
#import "ARModuleInteractorOutput.h"
#import "ARModuleModuleInput.h"
//#import "BasePresenter.h"

@protocol ARModuleViewInput;
@protocol ARModuleInteractorInput;
@protocol ARModuleRouterInput;

@interface ARModulePresenter : NSObject <ARModuleModuleInput, ARModuleViewOutput, ARModuleInteractorOutput>

@property (nonatomic, weak) id<ARModuleViewInput> view;
@property (nonatomic, strong) id<ARModuleInteractorInput> interactor;
@property (nonatomic, strong) id<ARModuleRouterInput> router;

@end
