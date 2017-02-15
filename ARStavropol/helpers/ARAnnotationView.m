//
//  ARAnnotationView.m
//  ARStavropol
//
//  Created by apple on 09.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "ARAnnotationView.h"

@interface ARAnnotationView ()

@property BOOL initialized;

@end

@implementation ARAnnotationView

- (id)init {
    self = [super initWithFrame:CGRectZero];
    [self initializeInternal];
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {

    self = [super initWithCoder:coder];
    [self initializeInternal];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initializeInternal];
    return self;
}

- (void)initializeInternal {
    if(self.initialized) {
        return;
    }
    self.initialized = YES;
    [self initialize];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self bindUi];
}

/// Will always be called once, no need to call super
- (void)initialize {
    
}

/// Called when distance/azimuth changes, intended to be used in subclasses
- (void)bindUi {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
