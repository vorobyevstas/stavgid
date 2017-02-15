//
//  DescriptionModuleDescriptionModulePresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleViewOutput.h"
#import "DescriptionModuleInteractorOutput.h"
#import "DescriptionModuleModuleInput.h"
#import "NetworkModel.h"
//#import "BasePresenter.h"

@protocol DescriptionModuleViewInput;
@protocol DescriptionModuleInteractorInput;
@protocol DescriptionModuleRouterInput;

@interface DescriptionModulePresenter : NSObject <DescriptionModuleModuleInput, DescriptionModuleViewOutput, DescriptionModuleInteractorOutput>

@property (nonatomic, weak) id<DescriptionModuleViewInput> view;
@property (nonatomic, strong) id<DescriptionModuleInteractorInput> interactor;
@property (nonatomic, strong) id<DescriptionModuleRouterInput> router;
@property Place *place;

@end
