
#define DEFAULT_FONT @"HelveticaNeue"
#define ADOPT_FONTS 1

#import "UIFabric.h"
#import "Functions.h"

#import "appSettings.h"

@implementation UIFabric
+(UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    
    UILabel *lab = [UILabel new];
    [parent addSubview:lab];
    lab.text = text;
    lab.textColor = color;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    if (modif) lab.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else lab.font = [UIFont fontWithName:fontName size:fontSize];
    return lab;
}

+ (UITextView *)textViewWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    
    UITextView *textView = [UITextView new];
    textView.text = text;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    textView.textColor = color;
    if (modif) textView.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else textView.font = [UIFont fontWithName:fontName size:fontSize];
    [parent addSubview:textView];
    return textView;
}

+ (UIWebView *)webView:(id)target andSuperView:(UIView *)parent {
    
    UIWebView *webView = [UIWebView new];
    webView.delegate = target;
    webView.backgroundColor = [UIColor whiteColor];
    [parent addSubview:webView];
    
    return webView;
}

+ (UILabel *) labelWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    
    UILabel *lab = [UILabel new];
    [parent addSubview:lab];
    lab.text = text;
    lab.textColor = color;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    lab.font = [UIFont fontWithName:fontName size:fontSize];
    return lab;
}

+ (UIScrollView *) scrollView:(UIView *)parent {
    
    UIScrollView *scroll = [UIScrollView new];
    [parent addSubview:scroll];
    
    return scroll;
}

+ (GMSMapView *)mapView:(UIView *)parent {
    GMSMapView *map = [GMSMapView new];
    [parent addSubview:map];
    map.myLocationEnabled = YES;
    return map;
}

+ (UIPageControl *)pageControl:(UIView *)parent {
    
    UIPageControl *page = [UIPageControl new];
    [parent addSubview:page];
    
    return page;
}

+ (UISearchBar *) searchBarWithPlaceholder:(NSString *)text andBackgroundColor:(UIColor *)color andInnerBackgroundColor:(UIColor *)inner andTextColor:(UIColor *)textColor andSuperView:(UIView *)parent {
    
    UISearchBar *search = [UISearchBar new];
    [parent addSubview:search];
    
    search.backgroundImage = [[UIImage alloc] init];
    search.backgroundColor = color;
    
    search.placeholder = text;
    
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setBackgroundColor:inner];
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{
                                                                                                 NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                                                 NSFontAttributeName : [UIFont systemFontOfSize:15]
                                                                                                 }];
    
    
//    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTextColor:textColor];
    
//    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:textColor}];
    
//    for (UIView *v in search.subviews)
//    {
//        if([Environment isVersion7OrHigher]) //checks UIDevice#systemVersion
//        {
//            for(id subview in v.subviews)
//            {
//                if ([v isKindOfClass:[UITextField class]])
//                {
//                    ((UITextField *)v).textColor = textColor;
//                }
//            }
//        }
//        
//        else
//        {
//            if ([v isKindOfClass:[UITextField class]])
//            {
//                ((UITextField *)v).textColor = color;
//            }
//        }
//    }
    
    return search;
}

+ (UISwitch *)SwitchOnTintColor:(UIColor *)onTintColor andThumbTintColor:(UIColor *)thumbTintColor andSuperView:(UIView *)parent andTarget:(id)target andAction:(SEL)action {
    
    UISwitch *switch1 = [UISwitch new];
    if(onTintColor) {
        switch1.onTintColor = onTintColor;
    }
    if(thumbTintColor) {
        switch1.thumbTintColor = thumbTintColor;
    }
    [switch1 addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    
    [parent addSubview:switch1];
    
    return switch1;
}

+ (UISegmentedControl *) SegmentedControlWithButtons:(NSArray *)buttonsName andBackgroundColor:(UIColor *)background andTintColor:(UIColor *)tint andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andTarget:(id)target andAction:(SEL)action andSuperView:(UIView *)parent {
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:buttonsName];
    [parent addSubview:segment];
    segment.tintColor = tint;
    segment.selectedSegmentIndex = 0;
    segment.backgroundColor = background;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    UIFont *font;
    if (modif) font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else font = [UIFont fontWithName:fontName size:fontSize];
    [segment setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    if(color != nil) {
        NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
        [segment setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
        [segment setTitleTextAttributes:highlightedAttributes forState:UIControlStateNormal];
    }
    
    [segment addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    
    return segment;
}

+(UIView *) viewWithBackgroundColor:(UIColor *)color andIsRoundCorner:(bool)corner andIsBorder:(bool)border  andSuperView:(UIView *)parent {
    
    UIView *v = [UIView new];
    [parent addSubview:v];
    v.backgroundColor = color;
    if (corner) {
        v.layer.cornerRadius = 3;
        v.clipsToBounds = YES;
    }
    if (border) {
        v.layer.borderWidth = 1;
        v.layer.borderColor = [[Functions colorWithRGBHex:0xeaeaea] CGColor];
    }
    return v;
}

+(UIImageView *) imageViewWithImageName:(NSString *)image andContentMode:(UIViewContentMode)contentMode iconMode:(bool)iconMode  andSuperView:(UIView *)parent {
    
    UIImageView *im = [[UIImageView alloc] init];
    [parent addSubview:im];
    if (image) [im setImage:[UIImage imageNamed:image]];
    im.contentMode = contentMode;
    
    if (iconMode) im.image = [im.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    return im;
}


+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    return [UIFabric buttonWithText:text andTextColor:color andFontName:fontName andFontModificator:nil andFontSize:fontSize andBackgroundColor:bcolor andImage:image andIsRoundCorner:corner andSuperView:parent];
}

+(UIButton *) buttonWithText:(NSString *)text andTextColor:(UIColor *)color  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andBackgroundColor:(UIColor *)bcolor andImage:(NSString *)image andIsRoundCorner:(bool)corner andSuperView:(UIView *)parent {
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
        if (!fontName) fontName = DEFAULT_FONT;
        if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
        
        if (modif) btn.titleLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else btn.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
    }
    btn.backgroundColor = bcolor;
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (corner) {
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
    }
    return btn;
    
}

+(UIButton *) buttonWithImage:(NSString *)image andIsRoundCorner:(bool)corner andTarget:(id)target andSelector:(SEL)selector andSuperView:(UIView *)parent {
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (corner) {
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *) buttonWithUIImage:(UIImage *)image andIsRoundCorner:(bool)corner andTarget:(id)target andSelector:(SEL)selector andSuperView:(UIView *)parent {
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
    }
    if (corner) {
        btn.layer.cornerRadius = 3;
        btn.clipsToBounds = YES;
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}
/*
+(UITextField *) textFieldWithPlaceholder:(NSString *)text andFontName:(NSString *)fontName andFontSize:(float)fontSize andSuperView:(UIView *)parent {
    return [UIFabric textFieldWithPlaceholder:text andFontName:fontName andFontModificator:nil andFontSize:fontSize andSuperView:parent];
}
*/

+(UITextField *) textFieldWithPlaceholder:(NSString *)text  andFontName:(NSString *)fontName andFontModificator:(NSString *)modif andFontSize:(float)fontSize andIsPassword:(bool)isPassword  andSuperView:(UIView *)parent {
    
    UITextField *inp = [UITextField new];
    [parent addSubview:inp];
    inp.placeholder = text;
    if (!fontName) fontName = DEFAULT_FONT;
    if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
    if (modif) inp.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, modif] size:fontSize]; else inp.font = [UIFont fontWithName:fontName size:fontSize];
    if (isPassword) inp.secureTextEntry = true;
    else inp.secureTextEntry = false;
    return inp;
 
}

+(UIButton *) wcRoundButtonWithText:(NSString *)text andBackgroundImage:(NSString *)bImage andOnBackgroundImage:(NSString *)bOnImage orImage:(NSString *)image andSuperView:(UIView *)parent{
    UIButton *btn = [UIButton new];
    [parent addSubview:btn];
    float fontSize = 29;
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        NSString *fontName = DEFAULT_FONT;
        if (ADOPT_FONTS) fontSize = fontSize * [Functions koefY];
        
        btn.titleLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-%@", fontName, @"Medium"] size:fontSize];
        if (bImage) [btn setBackgroundImage:[UIImage imageNamed:bImage] forState:UIControlStateNormal];
        if (bOnImage) [btn setBackgroundImage:[UIImage imageNamed:bOnImage] forState:UIControlStateHighlighted];
    }
    btn.backgroundColor = [UIColor clearColor];
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        if (bOnImage) [btn setImage:[UIImage imageNamed:bOnImage] forState:UIControlStateHighlighted];
    }
    
    //btn.layer.cornerRadius = 20;
    btn.clipsToBounds = YES;
    //btn.layer.borderWidth = 1;
    //btn.layer.borderColor = [[Functions colorWithRGBHex:0xeaeaea] CGColor];
 
    return btn;
    
}


@end

@implementation UICustomElementWCInput
+(UICustomElementWCInput *) createElementWithName:(NSString *)name andIcon:(NSString *)iconName andPaceHolder:(NSString *)placeHolder andTextSize:(float)textSize andIsPassword:(bool)isPassword andParent:(UIView *)parent {
    UICustomElementWCInput *el = [UICustomElementWCInput new];
    
    el.v = [UIFabric viewWithBackgroundColor: [Functions colorWithRGBHex:0xFFFFFF] andIsRoundCorner:YES andIsBorder:YES andSuperView:parent];
    
     el.im = [UIFabric imageViewWithImageName:iconName andContentMode:UIViewContentModeScaleAspectFit iconMode:false  andSuperView:el.v];
    
    el.lab = [UIFabric labelWithText:name andTextColor:[Functions colorWithRGBHex:0x3c3c3c] andFontName:nil  andFontModificator:@"Light" andFontSize:textSize andSuperView:el.v];
    
    el.inp = [UIFabric textFieldWithPlaceholder:placeHolder andFontName:nil andFontModificator:@"Medium" andFontSize:textSize andIsPassword:isPassword andSuperView: el.v];
   
    return el;
}

-(void) updateConstraints {
    [self.im mas_remakeConstraints:^(MASConstraintMaker *make) {
        //  if ([Functions IsIPhone6]) {
        make.width.equalTo(@18);
        make.height.equalTo(@18);
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.v.mas_left).with.offset(15*[Functions koefX]);
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
    [self.lab mas_remakeConstraints:^(MASConstraintMaker *make) {
        // if ([Functions IsIPhone6]) {
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.im.mas_right).with.offset(14*[Functions koefX]);
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
    [self.inp mas_remakeConstraints:^(MASConstraintMaker *make) {
        //if ([Functions IsIPhone6]) {
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.im.mas_right).with.offset(109*[Functions koefX]);
        // } else  if ([Functions IsIPhone4]) {
        
        //}
    }];
    
}

@end

@implementation UICustomSlider

+(UICustomSlider *) createElementWithHint:(NSString *)name andParent:(UIView *)parent {
    UICustomSlider *el = [UICustomSlider new];
    
    UIImageView *v = [UIImageView new];
    [parent addSubview:v];
    //v.backgroundColor = [UIColor blackColor];
    v.image = [UIImage imageNamed:@"swipe"];
    v.clipsToBounds = YES;
    el.v = v;
    v.contentMode = UIViewContentModeScaleAspectFit;
    
    el.im = [UIFabric imageViewWithImageName:@"swipe_slider" andContentMode:UIViewContentModeScaleAspectFit iconMode:false  andSuperView:el.v];
    
    el.lab = [UIFabric labelWithText:name andTextColor:[Functions colorWithRGBHex:0x333333] andFontName:nil  andFontModificator:@"Medium" andFontSize:18.0f andSuperView:el.v];
    
    return el;
    
}

-(void) updateConstraints {
    [self.im mas_remakeConstraints:^(MASConstraintMaker *make) {
        //  if ([Functions IsIPhone6]) {
        make.top.equalTo(self.v.mas_top).with.offset(1);
        make.bottom.equalTo(self.v.mas_bottom).with.offset(-1);
        make.width.equalTo(self.im.mas_height);
        make.left.equalTo(self.v.mas_left).with.offset(4.0*[Functions koefY]);
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
    [self.lab mas_remakeConstraints:^(MASConstraintMaker *make) {
        // if ([Functions IsIPhone6]) {
        make.centerY.equalTo(self.v);
        make.centerX.equalTo(self.v).with.offset(33*[Functions koefY]);
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
   
}
@end


@implementation UICustomElementGrayButton

+(UICustomElementGrayButton *) createElementWithTitle:(NSString *)title andImageName:(NSString *)image andTarget:(id)target andSelector:(SEL)selector andParent:(UIView *)parent {
    UICustomElementGrayButton *el = [UICustomElementGrayButton new];
    
    el.v = [UIFabric viewWithBackgroundColor: [UIColor clearColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:parent];
    
    el.btn = [UIFabric buttonWithImage:image andIsRoundCorner:NO andTarget:target andSelector:selector andSuperView:el.v];
    
    el.lab = [UIFabric labelWithText:title andTextColor:[Functions colorWithRGBHex:0x999999] andFontName:nil andFontModificator:@"Medium" andFontSize:12.5 andSuperView:el.v];
    
    el.ov = [UIFabric viewWithBackgroundColor:[UIColor clearColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:el.v];
   
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [el.ov addGestureRecognizer:tap];
    el.tap = tap;
    el.ov.userInteractionEnabled = true;
    
    return el;
}

-(void) updateConstraints{
    [self.btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.v.mas_top).with.offset(0);
        make.centerX.equalTo(self.v);
        make.width.equalTo(@(22*[Functions koefY]));
        make.height.equalTo(@(22*[Functions koefY]));
    }];
    
    [self.lab mas_remakeConstraints:^(MASConstraintMaker *make) {
        //  if ([Functions IsIPhone6]) {
        make.top.equalTo(self.btn.mas_bottom).with.offset(8*[Functions koefY]);
        make.centerX.equalTo(self.v);
        //make.height.equalTo(@(15*[Functions koefY]));
        make.bottom.equalTo(self.v.mas_bottom);
        make.width.equalTo(self.v.mas_width);

        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
    [self.ov mas_remakeConstraints:^(MASConstraintMaker *make) {
        //  if ([Functions IsIPhone6]) {
        make.top.equalTo(self.btn.mas_top);
        make.left.equalTo(self.lab.mas_left);
        make.right.equalTo(self.lab.mas_right);
        make.bottom.equalTo(self.lab.mas_bottom);
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
}

@end

@implementation UICustomElementButtonWithArrow

+(UICustomElementButtonWithArrow *) createElementWithTitle:(NSString *)title andImageName:(NSString *)image andTarget:(id)target andSelector:(SEL)selector andIsBorder:(bool)isBorder andHeigth:(float)height andParent:(UIView *)parent {
    UICustomElementButtonWithArrow *el = [UICustomElementButtonWithArrow new];
    
    el.v = [UIFabric viewWithBackgroundColor: [UIColor clearColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:parent];
    
    if (isBorder) {
        el.v.layer.cornerRadius = height/2.0;
        el.v.clipsToBounds = YES;
        el.v.layer.borderWidth = 1;
        el.v.layer.borderColor = [[Functions colorWithRGBHex:0x808080] CGColor];
    }
   
    el.btn = [UIFabric buttonWithText:title andTextColor:[UIColor whiteColor] andFontName:nil andFontModificator:@"Medium" andFontSize:14.5 andBackgroundColor:[UIColor clearColor] andImage:nil andIsRoundCorner:NO andSuperView:el.v];
    [el.btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    el.btnArrow = [UIFabric buttonWithImage:image andIsRoundCorner:NO andTarget:target andSelector:selector andSuperView:el.v];
    
    return el;
    
}

-(void) updateConstraints {
    [self.btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.v);
        make.left.equalTo(self.v.mas_left).with.offset(8*[Functions koefX]);
    }];
    
    [self.btnArrow mas_remakeConstraints:^(MASConstraintMaker *make) {
        //  if ([Functions IsIPhone6]) {
        make.left.equalTo(self.btn.mas_right).with.offset(10*[Functions koefX]);
        make.right.equalTo(self.v.mas_right).with.offset(-6*[Functions koefX]);
        make.centerY.equalTo(self.v);
        make.width.equalTo(@(15*[Functions koefY]));
        make.height.equalTo(@(15*[Functions koefY]));
        // } else  if ([Functions IsIPhone4]) {
        
        // }
    }];
    
}

@end
