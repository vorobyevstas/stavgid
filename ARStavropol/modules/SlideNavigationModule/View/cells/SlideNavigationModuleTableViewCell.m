//
//  SlideNavigationModuleSlideNavigationModuleTableViewCell.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleTableViewCell.h"
#import "Functions.h"

@implementation SlideNavigationModuleTableViewCell
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

#pragma mark - Методы SlideNavigationModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    self.background = [UIFabric imageViewWithImageName:@"backgound" andContentMode:UIViewContentModeScaleAspectFill iconMode:false andSuperView:self];

}
@end
