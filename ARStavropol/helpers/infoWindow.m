//
//  infoWindow.m
//  ARStavropol
//
//  Created by apple on 15.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "infoWindow.h"
#import "NetworkModel.h"

@implementation infoWindow

- (id)initWithFrame:(CGRect)frame withPoint:(PointObj *)point {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        [self addSubview:avatar];
        avatar.clipsToBounds = YES;
        avatar.contentMode = UIViewContentModeScaleAspectFill;
        if(point.avatar.length) {
            [avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/place?id=%li&picture=%@&width=%li", mydomain, point.pointId, point.avatar, (long)(self.frame.size.height*2)]] placeholderImage:[UIImage imageNamed:@"image-placeholder"] options:0];
        }
        else {
            avatar.image = [UIImage imageNamed:@"image-placeholder"];
        }
        
        UILabel *distance = [UILabel new];
        distance.font = [UIFont fontWithName:@"SFUIText-Regular" size:10*[Functions koefX]];
        distance.text = [NSString stringWithFormat:@"Расстояние: %.2f км", (float)(point.distance/1000)];
        distance.textColor = [UIColor blackColor];
        [self addSubview:distance];
        
        [distance mas_remakeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(self).with.offset(-5);
        }];
        
        UILabel *name = [UILabel new];
        name.font = [UIFont fontWithName:@"SFUIText-Bold" size:14*[Functions koefX]];
        name.text = point.name;
        name.textColor = [UIColor blackColor];
        name.numberOfLines = 0;
        [self addSubview:name];
        
        [name mas_remakeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(avatar.mas_right).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.top.equalTo(self).with.offset(10);
            make.bottom.lessThanOrEqualTo(distance.mas_top).with.offset(-5);
        }];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.backgroundColor = [UIColor redColor];
}

@end
