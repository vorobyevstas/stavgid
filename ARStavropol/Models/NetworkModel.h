//
//  NetworkModel.h
//  ARStavropol
//
//  Created by apple on 14.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PointObj : NSObject

@property NSInteger pointId;
@property NSInteger type; // 0 - place, 1 - adverts
@property NSString *name;
@property NSString *link;
@property NSString *avatar;
@property float latitude;
@property float longitude;
@property float distance;

@end

@interface Adverts : RLMObject

@property NSInteger advertsId;
@property NSString *link;
@property NSString *avatar;
@property float latitude;
@property float longitude;

+ (EKObjectMapping *)objectMapping;

@end

@interface Photo : RLMObject

@property NSInteger photoId;
@property NSString *filename;
@property NSInteger parent;

+ (EKObjectMapping *)objectMapping;

@end
RLM_ARRAY_TYPE(Photo)

@interface Place : RLMObject

@property NSInteger placeId;
@property NSString *name;
@property NSString *Description;
@property NSString *address;
@property float latitude;
@property float longitude;
@property RLMArray<Photo *><Photo> *photos;

+ (EKObjectMapping *)objectMapping;
+ (Place*)copy:(Place *)place;

@end

@interface NetworkModel : NSObject

@property BOOL success;
@property NSArray<Place *> *places;
@property NSArray<Adverts *> *adverts;

+ (EKObjectMapping *)objectMapping;

@end
