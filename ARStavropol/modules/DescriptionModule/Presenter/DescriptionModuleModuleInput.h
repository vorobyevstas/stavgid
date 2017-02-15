//
//  DescriptionModuleDescriptionModuleModuleInput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@protocol DescriptionModuleModuleInput <RamblerViperModuleInput>

/**
 @author apple

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule:(NSDictionary *)params;

@end
