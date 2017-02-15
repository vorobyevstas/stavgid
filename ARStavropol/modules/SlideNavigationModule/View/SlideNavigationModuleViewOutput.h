//
//  SlideNavigationModuleSlideNavigationModuleViewOutput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RETableViewManager;

@protocol SlideNavigationModuleViewOutput <NSObject>

/**
 @author apple

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;
- (void)backBtnTap;
- (void) setTableViewManager:(RETableViewManager*)manager;
- (void) viewWillApear;
@end
