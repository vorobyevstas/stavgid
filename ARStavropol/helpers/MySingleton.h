
@interface MySingleton : NSObject {
    
    NSTimer *voteTimer;
    NSInteger reload;
    NSInteger menu;
    NSInteger kostil;
}
@property (nonatomic) NSTimer *voteTimer;
@property (nonatomic) NSInteger reload;
@property (nonatomic) NSInteger menu;
@property (nonatomic) NSInteger kostil;

+(MySingleton *)sharedMySingleton;

@end
