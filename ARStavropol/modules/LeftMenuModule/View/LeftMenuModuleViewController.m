//
//  LeftMenuModuleLeftMenuModuleViewController.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "LeftMenuModuleViewController.h"
#import "Functions.h"
#import "LeftMenuModuleTableViewCell.h"
#import "LeftMenuModuleViewOutput.h"

@implementation LeftMenuModuleViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

    [[MySingleton sharedMySingleton] bk_removeAllBlockObservers];
    
    [[MySingleton sharedMySingleton] bk_addObserverForKeyPath:@"menu" task:^(id task){
        NSLog(@"wishes changed %@", task);
        [MySingleton sharedMySingleton].reload = 0;
//        [self viewWillAppear:NO];
        if([MySingleton sharedMySingleton].menu == 1) {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.arController withCompletion:nil];
        }
        else if([MySingleton sharedMySingleton].menu == 2) {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.placeController withCompletion:nil];
        }
        else {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.aboutController withCompletion:nil];
        }
    }];
    
	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [Functions setupNavigationController:self.navigationController andTitle:WCLocalize(@"LeftMenuModuleTitle") andItem:self.navigationItem withLeftBtn:[Functions setBackButton:self action:@selector(backBtnTap)] andRightBtn:[Functions setMoreButton:self action:@selector(moreBtnTap)]];
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    [self.background mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width - 60);
        make.height.mas_equalTo(self.view.frame.size.height - 100);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(20);
    }];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
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
    
    self.background = [UIFabric imageViewWithImageName:@"soldat" andContentMode:UIViewContentModeScaleAspectFit iconMode:false andSuperView:self.view];
    self.background.alpha = 0.3f;

    UITableView *tv = [[UITableView alloc] init];
    self.tableView = tv;
    self.tableView.bounces = NO;
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor clearColor];
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    RETableViewSection *dumbSection = [RETableViewSection sectionWithHeaderTitle:@""];
    [self.tableManager addSection:dumbSection];
    self.tableManager[@"LeftMenuModuleCellPresenter"] = @"LeftMenuModuleTableViewCell";
    self.tableManager[@"LeftMenuModuleHeaderCellPresenter"] = @"LeftMenuModuleTableViewHeaderCell";
    [self.output setTableViewManager:self.tableManager];
}
#pragma mark - Методы LeftMenuModuleViewInput

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

@end
