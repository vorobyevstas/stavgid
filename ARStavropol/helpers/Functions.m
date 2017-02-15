//
//  Functions.m

//

#import "Functions.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

@implementation Functions

+(float)koefY {
    return SCREEN_MAX_LENGTH/667.0;
}

+(float)koefX {
    return SCREEN_MIN_LENGTH/375.0;
}


+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2 {
    NSData *data1 = UIImagePNGRepresentation(image1);
    NSData *data2 = UIImagePNGRepresentation(image2);
    
    return [data1 isEqual:data2];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+(int)GetNetReachability
{
    NSLog(@"netstatus=%i",[[[NSUserDefaults standardUserDefaults] valueForKey:@"netstatus"] intValue]);
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"netstatus"] intValue]) return 1;
    else return 0;
}

+ (BOOL)IsIPhone4 {
    
    if(IS_IPHONE_4_OR_LESS) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (BOOL)IsIPhone5 {
    
    if(IS_IPHONE_5) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (BOOL)IsIPhone6 {
    if(IS_IPHONE_6) {
        return YES;
    }
    else {
        return NO;
    }
}


+ (UIBarButtonItem*)setMenuButton:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"ic_menu"];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
     backBtn.frame = CGRectMake(0, 0, 44, 44);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 44, 44)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 15, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    
    return backButton;
}

+ (UIBarButtonItem*)setMoreButton:(id)target action:(SEL)action {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more"];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 30, 44);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 0, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    
    return backButton;
}

+ (UIBarButtonItem*)setBackButton:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"ic_arrow_back"];
    [backBtn setImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    backButtonView.bounds = CGRectOffset(backButtonView.bounds, 12, 0);
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    
    return backButton;
}

+ (void)setupNavigationController:(UINavigationController *)navContr andTitle:(NSString *)title andItem:(UINavigationItem *) navItem withLeftBtn:(UIBarButtonItem*)leftBtn andRightBtn:(UIBarButtonItem*)rightBtn{
    //navContr.navigationBar.layer.shadowOpacity = 0.5f;
    navContr.navigationBar.hidden = false;
    navContr.navigationBar.backItem.title = @"";
    navContr.navigationBar.topItem.title = title;
    navContr.navigationBar.barTintColor = [Functions colorWithRGBHex:0xffc905];
    navContr.navigationBar.backgroundColor = [Functions colorWithRGBHex:0xffc905];
    navContr.navigationBar.translucent = NO;
    navContr.navigationBar.tintColor = [UIColor whiteColor];
    
    [navContr.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont fontWithName:@"SFUIText-Bold" size:24*[Functions koefY]]}];
    
//    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, -10, SCREEN_WIDTH - 120, 60)];
//    titleLab.textAlignment = NSTextAlignmentCenter;
//    titleLab.numberOfLines = 1;
//    titleLab.font = [UIFont fontWithName:@"SFUIText-Bold" size:24*[Functions koefY]];
//    titleLab.textColor = [UIColor whiteColor];
//    titleLab.text = title;
//    [navContr.navigationBar addSubview:titleLab];

//    NSString *first = @"ЭКОЮРС - Новости\n";
//    UIFont *arialFont = [UIFont fontWithName:@"SFUIText-Medium" size:16.0*[Functions koefY]];
//    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: arialFont forKey:NSFontAttributeName];
//    NSMutableAttributedString *aAttrString = [[NSMutableAttributedString alloc] initWithString:first attributes: arialDict];
//    
//    UIFont *VerdanaFont = [UIFont fontWithName:@"SFUIText-Regular" size:14.0*[Functions koefY]];
//    NSDictionary *verdanaDict = [NSDictionary dictionaryWithObject:VerdanaFont forKey:NSFontAttributeName];
//    NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString:title attributes:verdanaDict];
//    
//    [aAttrString appendAttributedString:vAttrString];
//    
//    
//    titleLab.attributedText = aAttrString;
    
    navItem.leftBarButtonItem = leftBtn;
    navItem.rightBarButtonItem = rightBtn;
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(size);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    [image drawInRect:rect];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


@end
