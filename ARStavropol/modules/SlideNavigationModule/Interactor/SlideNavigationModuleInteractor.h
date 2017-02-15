//
//  SlideNavigationModuleSlideNavigationModuleInteractor.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleInteractorInput.h"


@protocol SlideNavigationModuleInteractorOutput;

@interface SlideNavigationModuleInteractor : NSObject <SlideNavigationModuleInteractorInput>

@property (nonatomic, weak) id<SlideNavigationModuleInteractorOutput> output;

@end
