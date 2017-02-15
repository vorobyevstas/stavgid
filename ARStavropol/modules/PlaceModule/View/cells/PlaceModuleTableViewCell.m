//
//  PlaceModulePlaceModuleTableViewCell.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleTableViewCell.h"
#import "Functions.h"

@implementation PlaceModuleTableViewCell
#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 90*[Functions koefX];
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];
    
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    
    self.name.text = self.item.model.name;
    
    if(self.item.model.photos.count) {
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@api/place?id=%li&picture=%@&width=%li", mydomain, (long)self.item.model.placeId, self.item.model.photos[0].filename, (long)(200*[Functions koefX])]] placeholderImage:[UIImage imageNamed:@"image-placeholder"] options:SDWebImageProgressiveDownload];
    }
    else {
        self.avatar.image = [UIImage imageNamed:@"image-placeholder"];
    }
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Методы PlaceModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.backgroundColor = [UIColor clearColor];
    self.avatar = [UIFabric imageViewWithImageName:@"image-placeholder" andContentMode:UIViewContentModeScaleAspectFill iconMode:NO andSuperView:self];
    self.avatar.clipsToBounds = YES;
    
    [self.avatar mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(0);
        make.width.mas_equalTo(90*[Functions koefX]);
    }];

    self.name = [UIFabric labelWithText:@"" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:14 andSuperView:self];
    self.name.numberOfLines = 0;
    
    [self.name mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.avatar.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(0);
    }];
    
    self.border = [UIFabric viewWithBackgroundColor:[UIColor blackColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:self];
    self.border.alpha = 0.5f;
    
    [self.border mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(0);
        make.height.mas_equalTo(0.5f);
    }];
}
@end
