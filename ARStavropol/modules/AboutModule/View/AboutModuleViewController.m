//
//  AboutModuleAboutModuleViewController.m
//  ARStavropol
//
//  Created by apple on 14/02/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "AboutModuleViewController.h"
#import "Functions.h"
#import "AboutModuleTableViewCell.h"
#import "AboutModuleViewOutput.h"

@implementation AboutModuleViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [Functions setupNavigationController:self.navigationController andTitle:WCLocalize(@"О нас") andItem:self.navigationItem withLeftBtn:[Functions setBackButton:self action:@selector(backBtnTap)] andRightBtn:[Functions setMoreButton:self action:@selector(moreBtnTap)]];
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    
    [self.name mas_remakeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.view).with.offset(15*[Functions koefX]);
        make.left.equalTo(self.view).with.offset(15*[Functions koefX]);
        make.right.equalTo(self.view).with.offset(-15*[Functions koefX]);
    }];
    
    [self.version mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).with.offset(5*[Functions koefX]);
        make.left.equalTo(self.view).with.offset(15*[Functions koefX]);
        make.right.equalTo(self.view).with.offset(-15*[Functions koefX]);
    }];
    
    [self.Description mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.version.mas_bottom).with.offset(15*[Functions koefX]);
        make.left.equalTo(self.view).with.offset(15*[Functions koefX]);
        make.right.equalTo(self.view).with.offset(-15*[Functions koefX]);
    }];
    
    float width = 60*[Functions koefX];
    float padding = 20*[Functions koefX];
    
    [self.vk mas_remakeConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(width);
        make.bottom.equalTo(self.view).with.offset(-padding);
        make.centerX.equalTo(self.view).with.offset(-width+padding);
    }];
    
    [self.fb mas_remakeConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(width);
        make.bottom.equalTo(self.view).with.offset(-padding);
        make.centerX.equalTo(self.view).with.offset(width-padding);
    }];
    
    [self.social mas_remakeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.fb.mas_top).with.offset(-padding);
        make.centerX.equalTo(self.view).with.offset(0);
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

- (void)vkClick {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://vk.com/stavmobileapp"]];
}

- (void)fbClick {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/stavmobileapp/"]];
}

#pragma mark - Вспомогательные функции
- (void) createViewElements {
    
    self.name = [UIFabric labelWithText:@"Гид по Ставрополю" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Bold" andFontSize:26 andSuperView:self.view];
    self.name.numberOfLines = 0;
    self.name.textAlignment = NSTextAlignmentCenter;
    
    NSString * appVersionString = [NSString stringWithFormat:@"Версия: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    self.version = [UIFabric labelWithText:appVersionString andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:18 andSuperView:self.view];
    self.version.textAlignment = NSTextAlignmentCenter;

    self.Description = [UIFabric labelWithText:@"Это приложение для знакомства с историей Ставрополя при помощи дополненной реальности. Оно позволит Вам увидеть интересные места города через призму Вашего телефона." andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Regular" andFontSize:16 andSuperView:self.view];
    self.Description.numberOfLines = 0;
    self.Description.textAlignment = NSTextAlignmentJustified;
    
    self.social = [UIFabric labelWithText:@"Мы в соцсетях:" andTextColor:[UIColor blackColor] andFontName:@"SFUIText" andFontModificator:@"Bold" andFontSize:18 andSuperView:self.view];
    self.social.textAlignment = NSTextAlignmentCenter;
    
    self.vk = [UIFabric buttonWithImage:@"vk" andIsRoundCorner:NO andTarget:self andSelector:@selector(vkClick) andSuperView:self.view];
    
    self.fb = [UIFabric buttonWithImage:@"fb" andIsRoundCorner:NO andTarget:self andSelector:@selector(fbClick) andSuperView:self.view];
}
#pragma mark - Методы AboutModuleViewInput

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
