//
//  waitBarHelper.h

//

#import <Foundation/Foundation.h>
#import "waitBarProtocol.h"

@interface waitBarHelper : NSObject <waitBarProtocol>
+(waitBarHelper *) getSharedInstance;

@end
