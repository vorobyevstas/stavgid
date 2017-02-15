//
//  appSettings.m

//

#import "appSettings.h"
#import "Functions.h"

@implementation colorScheme

+ (NSDictionary *) getSchemes {
    static NSDictionary *schemes;
    if (!schemes) schemes = @{
                              @"backgroundColor": @(0xfcfcfc),
                              @"backViewColor" : @(0xf3f3f3),
                              @"separatorColor": @(0xC8C7CC),
                              @"labelTextColor1": @(0x030303),
                              @"buttonColor": @(0x3F51B5),
                              @"labelTextColor2": @(0xC7C7CD),
                              @"labelTextColor3" : @(0x3F51B5),
                              @"labelBlackColor" : @(0x000000),
                              @"greenButton" : @(0x60AA15),
                              @"tabbarColor" : @(0x3F51B5),
                              @"cellSubColor": @(0x9B9B9B),
                              @"callButtonTextColor": @(0xFFFFFF),
                              @"videoCaleeNameColor": @(0x4A4A4A),
                              @"A1": @(0x7ED321),
                              @"A2": @(0xF5A623),
                              @"A3": @(0xE23000),
                              @"A4": @(0x5B9AFF),
                              @"B1": @(0x09233C),
                              @"B2": @(0x545C76),
                              @"R1": @(0x4A4A4A),
                              @"R2": @(0x9B9B9B),
                              @"R3": @(0xD8D8D8),
                              @"R4": @(0xF4F4F4),
                              @"R5": @(0xFFFFFF),
                              };
    
    return schemes;
}


+ (UIColor *)colorWithSchemeName:(NSString *)schemeName
{
    NSDictionary *schemes = [self getSchemes];
    NSNumber *colorNum = [schemes valueForKey:schemeName];
    return [Functions colorWithRGBHex:[colorNum longValue]];
}

@end

@implementation appSettings
+(id<waitBarProtocol>) getWaitObj {
    return [waitBarHelper getSharedInstance];
}

+(id<popupMessageProtocol>) getPopupObj {
    return [popupMessageHelper getSharedInstance];
}

+(id<storageHelperProtocol>) getStorageObj {
    return [storageUserDefaultsHelper getSharedInstance];
}

@end
