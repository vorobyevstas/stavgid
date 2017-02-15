//
//  mainService.m
//  ARStavropol
//
//  Created by apple on 15.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "mainService.h"

@implementation mainService

- (void)getAll:(void(^)(void))completed {
    
    NSString *myurl = [NSString stringWithFormat:@"%@api", mydomain];
    myurl = [myurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"get url=%@", myurl);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"application/json"]];
    
    [manager GET:myurl parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        //        NSLog(@"%@", responseObject);
        NetworkModel *resp = [EKMapper objectFromExternalRepresentation:responseObject withMapping:[NetworkModel objectMapping]];
        if(resp.success) {
            
            [[RLMRealm defaultRealm] beginWriteTransaction];
            RLMResults *res = [Place allObjects];
            for(Place *cc in res) {
                [[RLMRealm defaultRealm] deleteObject:cc];
            }
            
            res = [Photo allObjects];
            for(Photo *cc in res) {
                [[RLMRealm defaultRealm] deleteObject:cc];
            }
            
            NSArray<Place *> *places = resp.places;
            for(Place *cc in places) {
                [Place createOrUpdateInRealm:[RLMRealm defaultRealm] withValue:cc];
            }
            
            res = [Adverts allObjects];
            for(Adverts *cc in res) {
                [[RLMRealm defaultRealm] deleteObject:cc];
            }
            
            NSArray<Adverts *> *adverts = resp.adverts;
            for(Adverts *cc in adverts) {
                [Adverts createOrUpdateInRealm:[RLMRealm defaultRealm] withValue:cc];
            }
            [[RLMRealm defaultRealm] commitWriteTransaction];
            if(completed) {
                completed();
            }
        }
        else {
            if(completed) {
                completed();
            }
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"wwwww=%@", error);
        if(completed) {
            completed();
        }
        
    }];
}

- (void)getPlaces:(void (^)(NSArray<PointObj *> *))completed {
    NSMutableArray *array = [NSMutableArray new];
    RLMResults *res = [Place allObjects];
    for(Place *cc in res) {
        Place *newCC = [Place copy:cc];
        [array addObject:newCC];
    }
    
    if(completed) {
        completed(array);
    }
}

- (void)getPoints:(void (^)(NSArray<PointObj *> *))completed {
    NSMutableArray *array = [NSMutableArray new];
    RLMResults *res = [Place allObjects];
    for(Place *cc in res) {
        PointObj *newCC = [PointObj new];
        newCC.pointId = cc.placeId;
        newCC.name = cc.name;
        newCC.latitude = cc.latitude;
        newCC.longitude = cc.longitude;
        newCC.type = 0;
        if(cc.photos.count) {
            newCC.avatar = cc.photos[0].filename;
        }
        else {
            newCC.avatar = @"";
        }
        CLLocation *locA = [[CLLocation alloc] initWithLatitude:cc.latitude longitude:cc.longitude];
        CLLocation *locB = [[CLLocation alloc] initWithLatitude:[MyLocation sharedInstance].locationManager.location.coordinate.latitude longitude:[MyLocation sharedInstance].locationManager.location.coordinate.longitude];
        CLLocationDistance distance = [locA distanceFromLocation:locB];
        newCC.distance = distance;
        [array addObject:newCC];
    }
    
    res = [Adverts allObjects];
    for(Adverts *cc in res) {
        PointObj *newCC = [PointObj new];
        newCC.pointId = cc.advertsId;
        newCC.name = @"";
        newCC.latitude = cc.latitude;
        newCC.longitude = cc.longitude;
        newCC.type = 1;
        newCC.avatar = cc.avatar;
        [array addObject:newCC];
    }
    
    if(completed) {
        completed(array);
    }
}

- (void)getPlaceWithId:(NSInteger)placeId completed:(void(^)(Place *))completed {
    
    Place *place = [Place new];
    RLMResults *res = [Place objectsWhere:[NSString stringWithFormat:@"placeId=%li", (long)placeId]];
    if(res.count) {
        Place *cc = [res firstObject];
        place = [Place copy:cc];
    }
    
    if(completed) {
        completed(place);
    }
}

@end
