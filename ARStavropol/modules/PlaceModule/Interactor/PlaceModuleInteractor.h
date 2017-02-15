//
//  PlaceModulePlaceModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleInteractorInput.h"
#import "mainService.h"

@protocol PlaceModuleInteractorOutput;

@interface PlaceModuleInteractor : NSObject <PlaceModuleInteractorInput>

@property (nonatomic, weak) id<PlaceModuleInteractorOutput> output;
@property (nonatomic, strong) mainService *mainService;

@end
