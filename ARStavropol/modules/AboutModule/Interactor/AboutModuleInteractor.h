//
//  AboutModuleAboutModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleInteractorInput.h"


@protocol AboutModuleInteractorOutput;

@interface AboutModuleInteractor : NSObject <AboutModuleInteractorInput>

@property (nonatomic, weak) id<AboutModuleInteractorOutput> output;

@end
