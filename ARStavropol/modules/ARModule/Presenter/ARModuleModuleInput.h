//
//  ARModuleARModuleModuleInput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ViperMcFlurry.h"

@protocol ARModuleModuleInput <RamblerViperModuleInput>

/**
 @author apple

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
