//
//  storageHelper.m

//

#import "storageHelper.h"

@implementation storageUserDefaultsHelper

+(storageUserDefaultsHelper *) getSharedInstance{
    static storageUserDefaultsHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    if (!sharedInstance) {
        dispatch_once(&onceToken, ^{
            sharedInstance = [[storageUserDefaultsHelper alloc] init];
        });
    }
    return sharedInstance;
    
}

-(void)saveDictionary:(NSDictionary *)dict {
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    for (NSString *key in dict) {
        [defs setObject:[dict valueForKey:key] forKey:key];
    }
    [defs synchronize];
  
}

-(id)getValueForKey:(NSString *)key {
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    return [defs valueForKey:key];
    
}
@end
