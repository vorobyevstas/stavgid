//
//  NetworkModel.m
//  ARStavropol
//
//  Created by apple on 14.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "NetworkModel.h"

@implementation PointObj

@end

@implementation Adverts

+ (NSArray *)indexedProperties {
    return @[@"advertsId"];
}

+ (NSString *)primaryKey {
    return @"advertsId";
}

+ (EKObjectMapping *)objectMapping {
    EKObjectMapping * mapping = [[EKObjectMapping alloc] initWithObjectClass:[Adverts class]];
    
    [mapping mapKeyPath:@"id" toProperty:@"advertsId"];
    [mapping mapKeyPath:@"link" toProperty:@"link"];
    [mapping mapKeyPath:@"avatar" toProperty:@"avatar"];
    [mapping mapKeyPath:@"latitude" toProperty:@"latitude"];
    [mapping mapKeyPath:@"longitude" toProperty:@"longitude"];
    
    return mapping;
}

@end

@implementation Photo

+ (EKObjectMapping *)objectMapping {
    EKObjectMapping * mapping = [[EKObjectMapping alloc] initWithObjectClass:[Photo class]];
    
    [mapping mapKeyPath:@"id" toProperty:@"photoId"];
    [mapping mapKeyPath:@"filename" toProperty:@"filename"];
    [mapping mapKeyPath:@"parent" toProperty:@"parent"];
    
    return mapping;
}

+ (NSArray *)indexedProperties {
    return @[@"parent"];
}

+ (NSString *)primaryKey {
    return @"photoId";
}

@end

@implementation Place

+ (NSArray *)indexedProperties {
    return @[@"name", @"placeId"];
}

+ (NSString *)primaryKey {
    return @"placeId";
}

+ (EKObjectMapping *)objectMapping {
    EKObjectMapping * mapping = [[EKObjectMapping alloc] initWithObjectClass:[Place class]];
    
    [mapping mapKeyPath:@"id" toProperty:@"placeId"];
    [mapping mapKeyPath:@"name" toProperty:@"name"];
    [mapping mapKeyPath:@"description" toProperty:@"Description"];
    [mapping mapKeyPath:@"address" toProperty:@"address"];
    [mapping mapKeyPath:@"latitude" toProperty:@"latitude"];
    [mapping mapKeyPath:@"longitude" toProperty:@"longitude"];
    [mapping hasMany:[Photo class] forKeyPath:@"photos" forProperty:@"photos" withObjectMapping:[Photo objectMapping]];
    
    return mapping;
}

+ (Place*)copy:(Place *)place {
    Place *newPlace = [Place new];
    newPlace.placeId = place.placeId;
    newPlace.name = place.name;
    newPlace.Description = place.Description;
    newPlace.address = place.address;
    newPlace.latitude = place.latitude;
    newPlace.longitude = place.longitude;
    NSMutableArray *photos = [NSMutableArray new];
    for(Photo *ph in place.photos) {
        Photo *newPh = [Photo new];
        newPh.photoId = ph.photoId;
        newPh.filename = ph.filename;
        newPh.parent = ph.parent;
        [photos addObject:newPh];
    }
    newPlace.photos = photos;
    return newPlace;
}

@end

@implementation NetworkModel

+ (EKObjectMapping *)objectMapping {
    EKObjectMapping * mapping = [[EKObjectMapping alloc] initWithObjectClass:[NetworkModel class]];
    
    [mapping mapKeyPath:@"success" toProperty:@"success"];
    [mapping hasMany:[Place class] forKeyPath:@"places" forProperty:@"places" withObjectMapping:[Place objectMapping]];
    [mapping hasMany:[Adverts class] forKeyPath:@"adverts" forProperty:@"adverts" withObjectMapping:[Adverts objectMapping]];
    
    return mapping;
}

@end
