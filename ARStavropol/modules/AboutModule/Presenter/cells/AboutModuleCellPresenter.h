//
//  AboutModuleAboutModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
//#import "AboutModuleModel.h"

@protocol AboutModuleCellInput <NSObject>

@end

@interface AboutModuleCellPresenter : RETableViewItem
//@property (strong, readwrite, nonatomic) AboutModuleModel *model;
@property (nonatomic, strong) id<AboutModuleCellInput> cell;
@end
