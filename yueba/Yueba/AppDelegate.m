//
//  AppDelegate.m
//  Yueba
//
//  Created by qingyun on 16/8/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "QYAccount.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)changeToHome{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"homeVC"];
    self.window.rootViewController = vc;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //win的rootvc
    self.window.rootViewController = [self loadRootVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

//根据登录情况,返回根视图控制器
-(UIViewController *)loadRootVC{
    if ([[QYAccount shareAccount] isLogin]) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"homeVC"];
        return vc;
    }else{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"loginHome"];
        return vc;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
