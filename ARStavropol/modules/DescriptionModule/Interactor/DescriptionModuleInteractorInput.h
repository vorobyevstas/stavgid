//
//  DescriptionModuleDescriptionModuleInteractorInput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"

@class RETableViewManager;
@protocol DescriptionModuleInteractorInput <NSObject>

- (void)setTableViewManager:(RETableViewManager*)manager;
- (void)showPlace:(Place *)place;
- (void)openPhoto:(NSInteger)photo;

@end
