//
//  PlaceModulePlaceModulePresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleViewOutput.h"
#import "PlaceModuleInteractorOutput.h"
#import "PlaceModuleModuleInput.h"
//#import "BasePresenter.h"

@protocol PlaceModuleViewInput;
@protocol PlaceModuleInteractorInput;
@protocol PlaceModuleRouterInput;

@interface PlaceModulePresenter : NSObject <PlaceModuleModuleInput, PlaceModuleViewOutput, PlaceModuleInteractorOutput>

@property (nonatomic, weak) id<PlaceModuleViewInput> view;
@property (nonatomic, strong) id<PlaceModuleInteractorInput> interactor;
@property (nonatomic, strong) id<PlaceModuleRouterInput> router;

@end
