

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define MAS_SHORTHAND_GLOBALS 1
#import "Masonry.h"
@import GoogleMaps;

@interface UIFabric : NSObject

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+ (UIWebView *)webView:(id)target andSuperView:(UIView *)parent;

+ (UIScrollView *) scrollView:(UIView *)parent;

+ (UIPageControl *)pageControl:(UIView *)parent;

+ (GMSMapView *)mapView:(UIView *)parent;

+ (UITextView *)textViewWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+(UIView *) viewWithBackgroundColor:(UIColor *)color andIsRoundCorner:(bool)corner andIsBorder:(bool)border  andSuperView:(UIView *)parent;

+ (UISearchBar *) searchBarWithPlaceholder:(NSString *)text andBackgroundColor:(UIColor *)color andInnerBackgroundColor:(UIColor *)inner andTextColor:(UIColor *)textColor andSuperView:(UIView *)parent;

+ (UISwitch *)SwitchOnTintColor:(UIColor *)onTintColor andThumbTintColor:(UIColor *)thumbTintColor andSuperView:(UIView *)parent andTarget:(id)target andAction:(SEL)action;

+(UIImageView *) imageViewWithImageName:(NSString *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent;

+(UIButton *) buttonWithImage:(NSString *)image andIsRoundCorner:(bool)corner andTarget:(id)target andSelector:(SEL)selector andSuperView:(UIView *)parent;

+(UIButton *) buttonWithUIImage:(UIImage *)image andIsRoundCorner:(bool)corner andTarget:(id)target andSelector:(SEL)selector andSuperView:(UIView *)parent;

//+(UITextField *) textFieldWithPlaceholder:(NSString *)text  andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent;

+(UITextField *) textFieldWithPlaceholder:(NSString *)text  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsPassword:(bool)isPassword andSuperView:(UIView *)parent;

+(UIButton *) wcRoundButtonWithText:(NSString *)text andBackgroundImage:(NSString *)bImage andOnBackgroundImage:(NSString *)bOnImage orImage:(NSString *)image andSuperView:(UIView *)parent;

+ (UISegmentedControl *) SegmentedControlWithButtons:(NSArray *)buttonsName andBackgroundColor:(UIColor *)background andTintColor:(UIColor *)tint andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andTarget:(id)target andAction:(SEL)action andSuperView:(UIView *)parent;

@end


@interface UICustomElementWCInput : NSObject
@property UIView *v;
@property UIImageView *im;
@property UILabel *lab;
@property UITextField *inp;

+(UICustomElementWCInput *) createElementWithName:(NSString *)name andIcon:(NSString *)iconName andPaceHolder:(NSString *)placeHolder andTextSize:(float)textSize andIsPassword:(bool)isPassword andParent:(UIView *)parent;

-(void) updateConstraints;

@end

@interface UICustomSlider : NSObject
@property UIImageView *v;
@property UIImageView *im;
@property UILabel *lab;

+(UICustomSlider *) createElementWithHint:(NSString *)name andParent:(UIView *)parent;

-(void) updateConstraints;

@end


@interface UICustomElementGrayButton : NSObject
@property UIView *v;
@property UIButton *btn;
@property UILabel *lab;
@property UIView *ov;
@property (strong) UITapGestureRecognizer *tap;

+(UICustomElementGrayButton *) createElementWithTitle:(NSString *)title andImageName:(NSString *)image andTarget:(id)target andSelector:(SEL)selector andParent:(UIView *)parent;

-(void) updateConstraints;
@end

@interface UICustomElementButtonWithArrow : NSObject
@property UIView *v;
@property UIButton *btn;
@property UIButton *btnArrow;

+(UICustomElementButtonWithArrow *) createElementWithTitle:(NSString *)title andImageName:(NSString *)image andTarget:(id)target andSelector:(SEL)selector andIsBorder:(bool)isBorder andHeigth:(float)height andParent:(UIView *)parent;

-(void) updateConstraints;
@end
