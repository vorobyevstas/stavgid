//
//  PlaceModulePlaceModuleInteractorOutput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"

@protocol PlaceModuleInteractorOutput <NSObject>

- (void)progressShow;
- (void)progressDismiss;
- (void)selectPlace:(Place *)place;

@end
