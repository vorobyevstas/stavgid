//
//  storageHelperProtocol.h

//

#import <Foundation/Foundation.h>

@protocol storageHelperProtocol <NSObject>
-(void)saveDictionary:(NSDictionary *)dict;
-(id)getValueForKey:(NSString *)key;
@end


