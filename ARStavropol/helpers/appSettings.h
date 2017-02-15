//
//  appSettings.h

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "waitBarHelper.h"
#import "popupMessageHelper.h"
#import "storageHelper.h"
#import "localizationService.h"

@interface colorScheme : NSObject
+(UIColor *)colorWithSchemeName:(NSString *)schemeName;

@end

@interface appSettings : NSObject
+(id<waitBarProtocol>) getWaitObj;
+(id<popupMessageProtocol>) getPopupObj;
+(id<storageHelperProtocol>) getStorageObj;
@end
