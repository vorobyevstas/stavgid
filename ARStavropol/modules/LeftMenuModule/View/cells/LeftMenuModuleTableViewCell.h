//
//  LeftMenuModuleLeftMenuModuleTableViewCell.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "LeftMenuModuleCellPresenter.h"

@interface LeftMenuModuleTableViewCell : RETableViewCell <LeftMenuModuleCellInput>

@property (strong, readwrite, nonatomic) LeftMenuModuleCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIView *border;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
