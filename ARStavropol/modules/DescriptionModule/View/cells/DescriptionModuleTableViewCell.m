//
//  DescriptionModuleDescriptionModuleTableViewCell.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleTableViewCell.h"
#import "Functions.h"

@implementation DescriptionModuleTableViewCell

#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    
    DescriptionModuleCellPresenter *myItem = (DescriptionModuleCellPresenter *)item;
    
    CGSize size = [myItem.model.name sizeWithFont:[UIFont fontWithName:@"SFUIText-Bold" size:17*[Functions koefY]] constrainedToSize:CGSizeMake(tableViewManager.tableView.frame.size.width - 30*[Functions koefX], CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize size2 = [myItem.model.Description sizeWithFont:[UIFont fontWithName:@"SFUIText-Regular" size:15*[Functions koefY]] constrainedToSize:CGSizeMake(tableViewManager.tableView.frame.size.width - 30*[Functions koefX], CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    return ceil(size.height) + ceil(size2.height) + 45*[Functions koefX];
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
    
    self.name.text = self.item.model.name;
    self.Description.text = self.item.model.Description;
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Методы DescriptionModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.backgroundColor = [UIColor clearColor];
    self.name = [UIFabric labelWithText:@"" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Bold" andFontSize:17 andSuperView:self];
    self.name.numberOfLines = 0;
    self.name.textAlignment = NSTextAlignmentCenter;

    [self.name mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(15*[Functions koefX]);
        make.right.equalTo(self).with.offset(-15*[Functions koefX]);
        make.top.equalTo(self).with.offset(15*[Functions koefX]);
    }];
    
    self.Description = [UIFabric labelWithText:@"" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:15 andSuperView:self];
    self.Description.numberOfLines = 0;
    self.Description.textAlignment = NSTextAlignmentJustified;
    
    [self.Description mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).with.offset(15*[Functions koefX]);
        make.right.equalTo(self).with.offset(-15*[Functions koefX]);
        make.top.equalTo(self.name.mas_bottom).with.offset(15*[Functions koefX]);
    }];
}

@end
