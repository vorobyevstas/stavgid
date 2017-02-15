//
//  popupMessageProtocol.h

//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PopupMessageType) {
    PopupMessageTypeError,
    PopupMessageTypeSuccess,
    PopupMessageTypeInfo
};

@protocol popupMessageProtocol <NSObject>
-(void)popupMessageWithTitle:(NSString *)title andDescription:(NSString *)descr andType:(PopupMessageType)mesType;

@end
