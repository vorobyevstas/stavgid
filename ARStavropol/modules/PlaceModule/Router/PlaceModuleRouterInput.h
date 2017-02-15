//
//  PlaceModulePlaceModuleRouterInput.h
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlaceModuleRouterInput <NSObject>

- (void)goBack;
- (void)openNewsDetailModuleWithParams:(NSDictionary *)params;

@end
