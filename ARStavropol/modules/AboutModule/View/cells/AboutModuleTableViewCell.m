//
//  AboutModuleAboutModuleTableViewCell.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleTableViewCell.h"
#import "Functions.h"

@implementation AboutModuleTableViewCell
#pragma mark - Методы RETableViewCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 44;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createViewElements];
    
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    //self.currencyLab.text = [self.item.model.currency uppercaseString];
}

#pragma mark - Методы обработки событий от визуальных элементов

#pragma mark - Методы AboutModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    self.background = [UIFabric imageViewWithImageName:@"backgound" andContentMode:UIViewContentModeScaleAspectFill iconMode:false andSuperView:self];

}
@end
