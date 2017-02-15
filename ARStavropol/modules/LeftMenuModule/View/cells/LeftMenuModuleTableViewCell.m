//
//  LeftMenuModuleLeftMenuModuleTableViewCell.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleTableViewCell.h"
#import "Functions.h"

@implementation LeftMenuModuleTableViewCell

#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50*[Functions koefX];
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];
    
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.icon.image = [UIImage imageNamed:self.item.model.icon];
    self.title.text = self.item.model.name;
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Методы LeftMenuModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    self.icon = [UIFabric imageViewWithImageName:@"" andContentMode:UIViewContentModeScaleAspectFit iconMode:false andSuperView:self];
    
    [self.icon mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(15*[Functions koefX]);
        make.centerY.equalTo(self).with.offset(0);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(12);
    }];

    self.title = [UIFabric labelWithText:@"" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:20 andSuperView:self];
    
    [self.title mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.icon.mas_right).with.offset(10);
        make.centerY.equalTo(self).with.offset(0);
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
