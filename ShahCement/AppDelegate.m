//
//  AppDelegate.m
//  ShahCement
//
//  Created by Huq Majharul on 2018/02/14.
//  Copyright © 2018 SmartMux Limited. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerVisualState.h"
#import "MMDrawerController.h"
#import "MenuController.h"

@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController *drawerController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#ifndef DEBUG
    [NSThread sleepForTimeInterval:2.0];
#endif
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setBarTintColor:APP_THEME_COLOR];
    NSMutableDictionary* navbarAttributes = [NSMutableDictionary dictionary];
    navbarAttributes[NSFontAttributeName] = [UIFont fontWithName:APP_ENGLISH_SEMI_BOLD_FONT size:14.0f];
    navbarAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextAttributes = navbarAttributes;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
    
    UIStoryboard                *storyboard    = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    MenuController           *menuController             = [storyboard instantiateViewControllerWithIdentifier:@"MenuController"];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:navigationController
                                                            leftDrawerViewController:menuController
                                                            rightDrawerViewController:nil];
    
    [self.drawerController setShowsShadow:YES];
    [self.drawerController setMaximumLeftDrawerWidth:300.0];
    [self.drawerController setMaximumRightDrawerWidth:300.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController setDrawerVisualStateBlock:[MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:1.0f]];
    
//    [self.drawerController
//     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//         MMDrawerControllerDrawerVisualStateBlock block;
//         block = [[MMExampleDrawerVisualStateManager sharedManager]
//                  drawerVisualStateBlockForDrawerSide:drawerSide];
//         if(block){
//             block(drawerController, drawerSide, percentVisible);
//         }
//     }];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.drawerController];
    [self.window makeKeyAndVisible];
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
