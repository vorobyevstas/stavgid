//
//  PlaceModulePlaceModuleTableViewCell.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import <RETableViewManager/RETableViewManager.h>
#import "PlaceModuleCellPresenter.h"

@interface PlaceModuleTableViewCell : RETableViewCell <PlaceModuleCellInput>

@property (strong, readwrite, nonatomic) PlaceModuleCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *border;

@end
