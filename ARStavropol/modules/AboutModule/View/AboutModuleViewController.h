//
//  AboutModuleAboutModuleViewController.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFabric.h"
#import "AboutModuleViewInput.h"
#import "RETableViewManager.h"

@protocol AboutModuleViewOutput;

@interface AboutModuleViewController : UIViewController <AboutModuleViewInput>

@property (nonatomic, strong) id<AboutModuleViewOutput> output;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *version;
@property (weak, nonatomic) IBOutlet UILabel *Description;
@property (weak, nonatomic) IBOutlet UILabel *social;
@property (weak, nonatomic) IBOutlet UIButton *vk;
@property (weak, nonatomic) IBOutlet UIButton *fb;

@end
