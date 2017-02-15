#import "MySingleton.h"


@implementation MySingleton

@synthesize voteTimer;
@synthesize reload;
@synthesize menu;
@synthesize kostil;

static MySingleton * sharedMySingleton = NULL;

+(MySingleton *)sharedMySingleton {
    if (!sharedMySingleton || sharedMySingleton == NULL) {
		sharedMySingleton = [MySingleton new];
	}
	return sharedMySingleton;
}

- (void)dealloc {
    
}

@end