//
//  localizationService.m


#import "localizationService.h"

@implementation localizationService
+(NSString *)getString:(NSString *)name {
    return NSLocalizedString(name, @"local");
}
@end
