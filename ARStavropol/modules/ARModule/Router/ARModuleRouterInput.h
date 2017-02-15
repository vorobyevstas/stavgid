//
//  ARModuleARModuleRouterInput.h
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ARModuleRouterInput <NSObject>

- (void)goBack;
- (void)openNewsDetailModuleWithParams:(NSDictionary *)params;

@end
