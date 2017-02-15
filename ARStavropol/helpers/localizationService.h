//
//  localizationService.h

//

#import <Foundation/Foundation.h>
#define WCLocalize(key) [localizationService getString:(key)]

@interface localizationService : NSObject
+(NSString *)getString:(NSString *)name;
@end
