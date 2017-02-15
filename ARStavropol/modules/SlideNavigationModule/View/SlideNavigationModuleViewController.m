//
//  SlideNavigationModuleSlideNavigationModuleViewController.m
//  ARStavropol
//
//  Created by apple on 31/01/2017.
//  Copyright © 2017 Vorobyev S.A.. All rights reserved.
//

#import "SlideNavigationModuleViewController.h"
#import "Functions.h"
#import "SlideNavigationModuleTableViewCell.h"
#import "SlideNavigationModuleViewOutput.h"
#import "LeftMenuModuleViewController.h"

@implementation SlideNavigationModuleViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"slide willAppear");
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    //
    LeftMenuModuleViewController *leftMenu = (LeftMenuModuleViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"LeftMenuModuleViewController"];
    
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;// self.leftViewController;
    [SlideNavigationController sharedInstance].enableShadow = YES;
    [SlideNavigationController sharedInstance].enableSwipeGesture = YES;
    
    
    [MySingleton sharedMySingleton].menu = 1;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Opened %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
        //        [self.LeftMenuDelegate MenuReload];
    }];
    
    [self.output viewWillApear];   
}

- (void)updateViewConstraints {
    
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
    
}
#pragma mark - Методы SlideNavigationModuleViewInput

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
