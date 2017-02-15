//
//  AppDelegate.h
//  ARStavropol
//
//  Created by apple on 30.01.17.
//  Copyright © 2017 Vorobyev Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property SlideNavigationController *firstViewController;
@property UIViewController *mapController;
@property UIViewController *placeController;
@property UIViewController *aboutController;

@end

