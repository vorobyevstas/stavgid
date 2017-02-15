//
//  mainService.h
//  ARStavropol
//
//  Created by apple on 15.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"

@interface mainService : NSObject

- (void)getAll:(void(^)(void))completed;
- (void)getPlaces:(void(^)(NSArray<PointObj *> *))points;
- (void)getPoints:(void (^)(NSArray<PointObj *> *))completed;
- (void)getPlaceWithId:(NSInteger)placeId completed:(void(^)(Place *))completed;

@end
