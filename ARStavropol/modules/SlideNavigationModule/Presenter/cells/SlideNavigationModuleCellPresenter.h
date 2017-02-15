//
//  SlideNavigationModuleSlideNavigationModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
//#import "SlideNavigationModuleModel.h"

@protocol SlideNavigationModuleCellInput <NSObject>

@end

@interface SlideNavigationModuleCellPresenter : RETableViewItem
//@property (strong, readwrite, nonatomic) SlideNavigationModuleModel *model;
@property (nonatomic, strong) id<SlideNavigationModuleCellInput> cell;
@end
