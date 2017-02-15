//
//  waitBarProtocol.h

//

#import <Foundation/Foundation.h>

@protocol waitBarProtocol <NSObject>
-(void)showWaitBarModal:(bool)modal;
-(void)dissmissWaitBar;
@end

