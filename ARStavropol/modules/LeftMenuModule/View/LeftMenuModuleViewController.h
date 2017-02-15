//
//  LeftMenuModuleLeftMenuModuleViewController.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "LeftMenuModuleViewInput.h"
#import "RETableViewManager.h"

@protocol LeftMenuModuleViewOutput;

@interface LeftMenuModuleViewController : UIViewController <LeftMenuModuleViewInput>

@property (nonatomic, strong) id<LeftMenuModuleViewOutput> output;

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *tableManager;

@property (strong, nonatomic) IBOutlet UIViewController *arController;
@property (strong, nonatomic) IBOutlet UIViewController *placeController;
@property (strong, nonatomic) IBOutlet UIViewController *aboutController;

@end
