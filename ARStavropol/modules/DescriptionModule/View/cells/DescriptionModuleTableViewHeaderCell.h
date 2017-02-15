//
//  DescriptionModuleTableViewHeaderCell.h
//  ARStavropol
//
//  Created by apple on 15.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "DescriptionModuleCellPresenter.h"

@interface DescriptionModuleTableViewHeaderCell : RETableViewCell <DescriptionModuleCellInput>

@property (strong, readwrite, nonatomic) DescriptionModuleHeaderCellPresenter *item;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIPageControl *page;

@end
