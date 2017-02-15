//
//  PlaceModulePlaceModuleViewController.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "PlaceModuleViewInput.h"
#import "RETableViewManager.h"

@protocol PlaceModuleViewOutput;

@interface PlaceModuleViewController : UIViewController <PlaceModuleViewInput>

@property (nonatomic, strong) id<PlaceModuleViewOutput> output;

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *tableManager;
@end
