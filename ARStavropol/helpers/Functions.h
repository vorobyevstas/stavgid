//
//  Functions.h

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString* const mydomain=@"http://mobtesting.ru/ar/";

@interface Functions : NSObject
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;
+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2;
+ (int)GetNetReachability;
+ (BOOL)IsIPhone4;
+ (BOOL)IsIPhone5;
+ (BOOL)IsIPhone6;
+ (UIBarButtonItem*)setMenuButton:(id)target action:(SEL)action;
+ (UIBarButtonItem*)setBackButton:(id)target action:(SEL)action;
+(void)setupNavigationController:(UINavigationController *)navContr andTitle:(NSString *) title andItem:(UINavigationItem *) navItem withLeftBtn:(UIBarButtonItem*)leftBtn andRightBtn:(UIBarButtonItem*)rightBtn;
+(float)koefY; //designed for iphone 6
+(float)koefX; //designed for iphone 6
+ (UIBarButtonItem*)setMoreButton:(id)target action:(SEL)action;

@end
