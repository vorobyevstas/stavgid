//
//  LeftMenuModuleLeftMenuModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "MenuModel.h"

@protocol LeftMenuModuleCellInput <NSObject>

@end

@interface LeftMenuModuleHeaderCellPresenter : RETableViewItem

@property (strong, readwrite, nonatomic) MenuModel *model;
@property (nonatomic, strong) id<LeftMenuModuleCellInput> cell;

@end

@interface LeftMenuModuleCellPresenter : RETableViewItem

@property (strong, readwrite, nonatomic) MenuModel *model;
@property (nonatomic, strong) id<LeftMenuModuleCellInput> cell;

@end
