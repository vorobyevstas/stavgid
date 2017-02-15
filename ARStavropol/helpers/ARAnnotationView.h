//
//  ARAnnotationView.h
//  ARStavropol
//
//  Created by apple on 09.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ARAnnotation.h"

@interface ARAnnotationView : UIView

//@property (weak, nonatomic) ARAnnotation *annotation;

- (id)init;
- (id)initWithCoder:(NSCoder *)coder;
- (id)initWithFrame:(CGRect)frame;
//- (id)initWithFrame:(CGRect)frame andAnnotation:(ARAnnotation *)annotation;
- (void)initialize;
- (void)bindUi;
- (void)awakeFromNib;

@end
