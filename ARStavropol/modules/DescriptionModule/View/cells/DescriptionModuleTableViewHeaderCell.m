//
//  DescriptionModuleTableViewHeaderCell.m
//  ARStavropol
//
//  Created by apple on 15.02.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "DescriptionModuleTableViewHeaderCell.h"

@implementation DescriptionModuleTableViewHeaderCell

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
    
    self.page.numberOfPages = self.item.model.count;
    
    if(self.item.model.count) {
        for(int i=0;i<self.item.model.count;i++) {
            Photo *photo = self.item.model[i];
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.parentTableView.frame.size.width, 0, self.parentTableView.frame.size.width, 200*[Functions koefX])];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.tag = i;
            [self.scroll addSubview:img];
            
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickPhoto:)];
            gesture.numberOfTapsRequired = 1;
            img.userInteractionEnabled = YES;
            [img addGestureRecognizer:gesture];
            
            [img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@api/place?id=%li&picture=%@&width=%li", mydomain, (long)photo.parent, photo.filename, (long)(self.parentTableView.frame.size.width*2)]] placeholderImage:[UIImage imageNamed:@"image-placeholder"] options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageUrl){
            }];
        }
        self.scroll.contentSize = CGSizeMake(self.parentTableView.frame.size.width*self.item.model.count, 200*[Functions koefX]);
    }
    else {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.parentTableView.frame.size.width, 200*[Functions koefX])];
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.image = [UIImage imageNamed:@"image-placeholder"];
        [self.scroll addSubview:img];
        
        self.scroll.contentSize = CGSizeMake(self.parentTableView.frame.size.width, 200*[Functions koefX]);
    }
}

#pragma mark - Методы обработки событий от визуальных элементов

- (void)clickPhoto:(UITapGestureRecognizer *)sender {
    [self.item openPhoto:sender.view.tag];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scroll.frame.size.width;
    float fractionalPage = self.scroll.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.page.currentPage = page;
}

#pragma mark - Методы DescriptionModuleCellInput

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    self.backgroundColor = [UIColor clearColor];
    
    self.scroll = [UIFabric scrollView:self];
    self.scroll.pagingEnabled = YES;
    self.scroll.delegate = (id)self;
    
    [self.scroll mas_remakeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self);
    }];
    
    self.page = [UIFabric pageControl:self];
    
    [self.page mas_remakeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.scroll).with.offset(0);
        make.right.equalTo(self.scroll).with.offset(0);
        make.bottom.equalTo(self.scroll).with.offset(0);
    }];
}

@end
