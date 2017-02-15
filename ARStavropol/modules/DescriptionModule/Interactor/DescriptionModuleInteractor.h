//
//  DescriptionModuleDescriptionModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleInteractorInput.h"


@protocol DescriptionModuleInteractorOutput;

@interface DescriptionModuleInteractor : NSObject <DescriptionModuleInteractorInput>

@property (nonatomic, weak) id<DescriptionModuleInteractorOutput> output;

@end
