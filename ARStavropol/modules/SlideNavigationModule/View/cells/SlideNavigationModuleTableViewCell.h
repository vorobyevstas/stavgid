//
//  SlideNavigationModuleSlideNavigationModuleTableViewCell.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "SlideNavigationModuleCellPresenter.h"

@interface SlideNavigationModuleTableViewCell : RETableViewCell <SlideNavigationModuleCellInput>

@property (strong, readwrite, nonatomic) SlideNavigationModuleCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIImageView *background;
@end
