//
//  DescriptionModuleDescriptionModuleViewController.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "DescriptionModuleViewController.h"
#import "Functions.h"
#import "DescriptionModuleTableViewCell.h"
#import "DescriptionModuleViewOutput.h"
#import "MWPhotoBrowser.h"

@implementation DescriptionModuleViewController

MWPhotoBrowser *browser;

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [Functions setupNavigationController:self.navigationController andTitle:@"Ставрополь" andItem:self.navigationItem withLeftBtn:[Functions setBackButton:self action:@selector(backBtnTap)] andRightBtn:nil];
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

#pragma mark - Методы обработки событий от визуальных элементов
-(void)backBtnTap {
    [self.output backBtnTap];
}

-(void)moreBtnTap {
    
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    UITableView *tv = [[UITableView alloc] init];
    self.tableView = tv;
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor clearColor];
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    RETableViewSection *dumbSection = [RETableViewSection sectionWithHeaderTitle:@""];
    [self.tableManager addSection:dumbSection];
    self.tableManager[@"DescriptionModuleHeaderCellPresenter"] = @"DescriptionModuleTableViewHeaderCell";
    self.tableManager[@"DescriptionModuleCellPresenter"] = @"DescriptionModuleTableViewCell";
    [self.output setTableViewManager:self.tableManager];
}
#pragma mark - Методы DescriptionModuleViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
    [self createViewElements];
}

- (void)progressShow {
    [SVProgressHUD show];
}

- (void)progressDismiss {
    [SVProgressHUD dismiss];
}

- (void)openPhoto:(NSInteger)photo {
    
    [self.navigationController pushViewController:browser animated:YES];
    
    [browser setCurrentPhotoIndex:photo];
}

- (void)initPhoto:(NSArray<Photo *> *)photos {
    self.photoArray = [NSMutableArray new];
    for(int i=0;i<photos.count;i++) {
        NSLog(@"photo %@", [NSString stringWithFormat:@"%@api/place?id=%li&picture=%@&width=%li", mydomain, (long)photos[i].parent, photos[i].filename, (long)(self.view.frame.size.width*2)]);
        [self.photoArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@api/place?id=%li&picture=%@&width=%li", mydomain, (long)photos[i].parent, photos[i].filename, (long)(self.view.frame.size.width*2)]]]];
    }
    
    browser = [[MWPhotoBrowser alloc] initWithDelegate:(id)self];
    
    // Set options
    browser.displayActionButton = YES; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = YES; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    browser.autoPlayOnAppear = NO; // Auto-play first video
    
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:1];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return self.photoArray.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.photoArray.count) {
        return [self.photoArray objectAtIndex:index];
    }
    return nil;
}

@end
