//
//  PartialTransparentView.h
//  florarea
//
//  Created by apple on 09.07.16.
//  Copyright © 2016 Vorobyev Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PartialTransparentView : UIView {
    CGRect holeRect;
    UIColor *backgroundColor;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor*)color andTransparentRects:(CGRect)holeRect;

@end
