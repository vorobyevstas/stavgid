//
//  SlideNavigationModuleSlideNavigationModuleViewController.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "SlideNavigationModuleViewInput.h"
#import "RETableViewManager.h"

@protocol SlideNavigationModuleViewOutput;

@interface SlideNavigationModuleViewController : SlideNavigationController <SlideNavigationModuleViewInput>

@property (nonatomic, strong) id<SlideNavigationModuleViewOutput> output;

@property UIViewController *leftViewController;
@property (strong, nonatomic) IBOutlet UIViewController *arController;

@end
