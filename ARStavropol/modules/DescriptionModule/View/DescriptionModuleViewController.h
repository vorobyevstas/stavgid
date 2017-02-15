//
//  DescriptionModuleDescriptionModuleViewController.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "DescriptionModuleViewInput.h"
#import "RETableViewManager.h"

@protocol DescriptionModuleViewOutput;

@interface DescriptionModuleViewController : UIViewController <DescriptionModuleViewInput>

@property (nonatomic, strong) id<DescriptionModuleViewOutput> output;

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *tableManager;
@property NSMutableArray *photoArray;

@end
