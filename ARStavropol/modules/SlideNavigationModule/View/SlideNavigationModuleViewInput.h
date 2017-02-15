//
//  SlideNavigationModuleSlideNavigationModuleViewInput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SlideNavigationModuleViewInput <NSObject>

/**
 @author apple

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)progressShow;
- (void)progressDismiss;

@end
