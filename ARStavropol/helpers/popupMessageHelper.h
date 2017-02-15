//
//  popupMessageHelper.h

//

#import <Foundation/Foundation.h>
#import "popupMessageProtocol.h"

@interface popupMessageHelper : NSObject <popupMessageProtocol>
+(popupMessageHelper *) getSharedInstance;
@end
