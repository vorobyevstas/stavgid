//
//  DescriptionModuleDescriptionModuleTableViewCell.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "DescriptionModuleCellPresenter.h"

@interface DescriptionModuleTableViewCell : RETableViewCell <DescriptionModuleCellInput>

@property (strong, readwrite, nonatomic) DescriptionModuleCellPresenter *item;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *Description;

@end
