//
//  LeftMenuModuleLeftMenuModuleViewInput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LeftMenuModuleViewInput <NSObject>

/**
 @author apple

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)progressShow;
- (void)progressDismiss;

@end
