//
//  AppDelegate.m
//  BT-1.0
//
//  Created by ChipSea on 14-9-19.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "MeViewController.h"
#import "CationViewController.h"
#import "HealthViewController.h"
#import "SetViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[[MeViewController alloc] init]];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[[CationViewController alloc] init]];
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[[HealthViewController alloc] init]];
    
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[[SetViewController alloc] init]];
    
    nav1.title = @"个性";
    nav2.title = @"交际圈";
    nav3.title = @"健康推荐";
    nav4.title = @"个性设置";
    
    nav1.navigationBar.translucent = NO;
    nav2.navigationBar.translucent = NO;
    nav3.navigationBar.translucent = NO;
    nav4.navigationBar.translucent = NO;
    
    nav1.tabBarItem.image  = [UIImage imageNamed:@"activity_main_navis_1_r"];
    nav2.tabBarItem.image  = [UIImage imageNamed:@"activity_main_navis_2_r"];
    nav3.tabBarItem.image = [UIImage imageNamed:@"activity_main_navis_3_r"];
    nav4.tabBarItem.image   = [UIImage imageNamed:@"activity_main_navis_4_r"];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    self.window.rootViewController = tabBar;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
