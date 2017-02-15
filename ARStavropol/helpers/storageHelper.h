//
//  storageHelper.h

//

#import <Foundation/Foundation.h>
#import "storageHelperProtocol.h"

@interface storageUserDefaultsHelper : NSObject <storageHelperProtocol>
+(storageUserDefaultsHelper *) getSharedInstance;


@end
