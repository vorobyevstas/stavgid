//
//  AboutModuleAboutModuleTableViewCell.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "AboutModuleCellPresenter.h"

@interface AboutModuleTableViewCell : RETableViewCell <AboutModuleCellInput>

@property (strong, readwrite, nonatomic) AboutModuleCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIImageView *background;
@end
