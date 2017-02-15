//
//  PlaceModulePlaceModuleViewOutput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;

@protocol PlaceModuleViewOutput <NSObject>

/**
 @author apple

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;
- (void)backBtnTap;
- (void) setTableViewManager:(RETableViewManager*)manager;
- (void) viewWillApear;
@end
