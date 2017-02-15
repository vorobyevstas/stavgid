//
//  AppDelegate.m
//  ARStavropol
//
//  Created by apple on 30.01.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "LeftMenuModuleViewController.h"
@import GoogleMaps;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[[Crashlytics class]]];
    [GMSServices provideAPIKey:@"AIzaSyDZTVTmbLQIyGvtJ2fY6erE-ipdqnBvYnw"];
    
//    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
//    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
//    self.window.rootViewController = self.firstViewController;
    
    self.firstViewController = [[SlideNavigationController alloc] initWithRootViewController:self.mapController];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    //
    LeftMenuModuleViewController *leftMenu = (LeftMenuModuleViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"LeftMenuModuleViewController"];
    
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;//self.leftController;
    [SlideNavigationController sharedInstance].enableShadow = YES;
    [SlideNavigationController sharedInstance].enableSwipeGesture = YES;
    
    [MySingleton sharedMySingleton].menu = 0;
    [MySingleton sharedMySingleton].reload = 0;
    
    [[MySingleton sharedMySingleton] bk_addObserverForKeyPath:@"menu" task:^(id task){
        NSLog(@"appdelegate wishes changed %@ %li", task, (long)[MySingleton sharedMySingleton].menu);
        [MySingleton sharedMySingleton].reload = 0;
        //        [self viewWillAppear:NO];
        if([MySingleton sharedMySingleton].menu == 1) {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.mapController withCompletion:nil];
        }
        else if([MySingleton sharedMySingleton].menu == 2) {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.placeController withCompletion:nil];
        }
        else if([MySingleton sharedMySingleton].menu == 3) {
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:self.aboutController withCompletion:nil];
        }
    }];
    
    //    self.firstViewController.leftMenu = self.leftController;
    //    self.firstViewController.enableShadow = YES;
    //    self.firstViewController.enableSwipeGesture = YES;
    //    [self.firstViewController setViewControllers:@[self.newsController] animated:NO];
    
    self.window.rootViewController = self.firstViewController;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
