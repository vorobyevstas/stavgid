//
//  ARModuleARModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
//#import "ARModuleModel.h"

@protocol ARModuleCellInput <NSObject>

@end

@interface ARModuleCellPresenter : RETableViewItem
//@property (strong, readwrite, nonatomic) ARModuleModel *model;
@property (nonatomic, strong) id<ARModuleCellInput> cell;
@end
