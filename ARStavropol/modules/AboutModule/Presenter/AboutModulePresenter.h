//
//  AboutModuleAboutModulePresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleViewOutput.h"
#import "AboutModuleInteractorOutput.h"
#import "AboutModuleModuleInput.h"
//#import "BasePresenter.h"

@protocol AboutModuleViewInput;
@protocol AboutModuleInteractorInput;
@protocol AboutModuleRouterInput;

@interface AboutModulePresenter : NSObject <AboutModuleModuleInput, AboutModuleViewOutput, AboutModuleInteractorOutput>

@property (nonatomic, weak) id<AboutModuleViewInput> view;
@property (nonatomic, strong) id<AboutModuleInteractorInput> interactor;
@property (nonatomic, strong) id<AboutModuleRouterInput> router;

@end
