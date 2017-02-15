//
//  DescriptionModuleDescriptionModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "NetworkModel.h"
#import "DescriptionModuleInteractorInput.h"

@protocol DescriptionModuleCellInput <NSObject>

@end

@interface DescriptionModuleHeaderCellPresenter : RETableViewItem
@property (strong, readwrite, nonatomic) NSArray<Photo *> *model;
@property (nonatomic, strong) id<DescriptionModuleCellInput> cell;
@property (nonatomic, strong) id<DescriptionModuleInteractorInput> interactor;

- (void)openPhoto:(NSInteger)photo;

@end

@interface DescriptionModuleCellPresenter : RETableViewItem
@property (strong, readwrite, nonatomic) Place *model;
@property (nonatomic, strong) id<DescriptionModuleCellInput> cell;
@end
