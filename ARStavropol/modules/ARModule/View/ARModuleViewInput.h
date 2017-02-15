//
//  ARModuleARModuleViewInput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"

@protocol ARModuleViewInput <NSObject>

/**
 @author apple

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)progressShow;
- (void)progressDismiss;
- (void)receivedPoints:(NSArray <PointObj *> *)points;

@end
