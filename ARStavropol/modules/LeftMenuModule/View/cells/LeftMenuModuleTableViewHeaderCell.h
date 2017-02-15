//
//  LeftMenuModuleTableViewHeaderCell.h
//  ARStavropol
//
//  Created by apple on 14.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RETableViewManager/RETableViewManager.h>
#import "LeftMenuModuleCellPresenter.h"

@interface LeftMenuModuleTableViewHeaderCell : RETableViewCell <LeftMenuModuleCellInput>

@property (strong, readwrite, nonatomic) LeftMenuModuleHeaderCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIImageView *gerb;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
