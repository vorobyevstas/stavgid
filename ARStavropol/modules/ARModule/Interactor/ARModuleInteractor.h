//
//  ARModuleARModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "ARModuleInteractorInput.h"
#import "mainService.h"

@protocol ARModuleInteractorOutput;

@interface ARModuleInteractor : NSObject <ARModuleInteractorInput>

@property (nonatomic, weak) id<ARModuleInteractorOutput> output;
@property (nonatomic, strong) mainService *mainService;

@end
