//
//  LeftMenuModuleTableViewHeaderCell.m
//  ARStavropol
//
//  Created by apple on 14.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "LeftMenuModuleTableViewHeaderCell.h"

@implementation LeftMenuModuleTableViewHeaderCell

#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200*[Functions koefX];
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];
    
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Методы LeftMenuModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    
    self.gerb = [UIFabric imageViewWithImageName:@"gerb" andContentMode:UIViewContentModeScaleAspectFit iconMode:false andSuperView:self];

    [self.gerb mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(15*[Functions koefX]);
        make.top.equalTo(self).with.offset(30*[Functions koefX]);
        make.height.mas_equalTo(60*[Functions koefX]);
        make.width.mas_equalTo(60*[Functions koefX]);
    }];
    
    self.title = [UIFabric labelWithText:@"Гид по историческому Ставрополю" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Bold" andFontSize:18 andSuperView:self];
    self.title.numberOfLines = 0;
    self.title.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.title mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.gerb.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(-70);
        make.centerY.equalTo(self.gerb).with.offset(0);
    }];
//
//    self.border = [UIFabric viewWithBackgroundColor:[UIColor blackColor] andIsRoundCorner:NO andIsBorder:NO andSuperView:self];
//    self.border.alpha = 0.5f;
//    
//    [self.border mas_remakeConstraints:^(MASConstraintMaker *make){
//        make.left.equalTo(self).with.offset(0);
//        make.right.equalTo(self).with.offset(0);
//        make.bottom.equalTo(self).with.offset(0);
//        make.height.mas_equalTo(0.5f);
//    }];
}

@end
