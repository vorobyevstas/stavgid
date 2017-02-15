//
//  SlideNavigationModuleSlideNavigationModulePresenter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleViewOutput.h"
#import "SlideNavigationModuleInteractorOutput.h"
#import "SlideNavigationModuleModuleInput.h"
//#import "BasePresenter.h"

@protocol SlideNavigationModuleViewInput;
@protocol SlideNavigationModuleInteractorInput;
@protocol SlideNavigationModuleRouterInput;

@interface SlideNavigationModulePresenter : NSObject <SlideNavigationModuleModuleInput, SlideNavigationModuleViewOutput, SlideNavigationModuleInteractorOutput>

@property (nonatomic, weak) id<SlideNavigationModuleViewInput> view;
@property (nonatomic, strong) id<SlideNavigationModuleInteractorInput> interactor;
@property (nonatomic, strong) id<SlideNavigationModuleRouterInput> router;

@end
