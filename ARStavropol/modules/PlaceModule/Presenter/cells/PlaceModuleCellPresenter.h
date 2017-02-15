//
//  PlaceModulePlaceModuleCellPresenter.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "NetworkModel.h"

@protocol PlaceModuleCellInput <NSObject>

@end

@interface PlaceModuleCellPresenter : RETableViewItem
@property (strong, readwrite, nonatomic) Place *model;
@property (nonatomic, strong) id<PlaceModuleCellInput> cell;
@end
