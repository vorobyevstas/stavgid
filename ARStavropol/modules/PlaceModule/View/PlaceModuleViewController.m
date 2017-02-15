//
//  PlaceModulePlaceModuleViewController.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "PlaceModuleViewController.h"
#import "Functions.h"
#import "PlaceModuleTableViewCell.h"
#import "PlaceModuleViewOutput.h"

@implementation PlaceModuleViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [Functions setupNavigationController:self.navigationController andTitle:WCLocalize(@"Ставрополь") andItem:self.navigationItem withLeftBtn:[Functions setBackButton:self action:@selector(backBtnTap)] andRightBtn:[Functions setMoreButton:self action:@selector(moreBtnTap)]];
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

-(IBAction)action:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:1 withCompletion:nil];
    
}

#pragma mark - Методы обработки событий от визуальных элементов
-(void)backBtnTap {
    [self.output backBtnTap];
}

-(void)moreBtnTap {
    
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.background = [UIFabric imageViewWithImageName:@"backgound" andContentMode:UIViewContentModeScaleAspectFill iconMode:false andSuperView:self.view];

    UITableView *tv = [[UITableView alloc] init];
    self.tableView = tv;
    [self.view addSubview:tv];
    tv.backgroundColor = [UIColor clearColor];
    tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    RETableViewSection *dumbSection = [RETableViewSection sectionWithHeaderTitle:@""];
    [self.tableManager addSection:dumbSection];
    self.tableManager[@"PlaceModuleCellPresenter"] = @"PlaceModuleTableViewCell";
    [self.output setTableViewManager:self.tableManager];
}
#pragma mark - Методы PlaceModuleViewInput

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
