//
//  AppDelegate.m
//  Hope
//
//  Created by Dana Buca on 20/10/2018.
//  Copyright © 2018 Dana Bucadana. All rights reserved.
//

#import "AppDelegate.h"
#import "ActivitiesViewController.h"
#import "ProgressViewController.h"
#import "ObjectiveViewController.h"
#import "ProfileViewController.h"
#import "FeedViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // set status bar style
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // set navigation bar text color
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [self initializeViewControllers];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (NSArray*) initializeViewControllers {
    //Set Activities tab
    ActivitiesViewController *activitiesView = [[ActivitiesViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *activitiesNav = [[UINavigationController alloc] initWithRootViewController:activitiesView];
    UIImage *img = [UIImage imageNamed:@"activity_2x.png"];
    activitiesNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Activities", nil) image:img tag:0];
    
    //Set Progress tab
    ProgressViewController *progressView = [[ProgressViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *progressNav = [[UINavigationController alloc] initWithRootViewController:progressView];
    UIImage *imgProgress = [UIImage imageNamed:@"progress_2x.png"];
    progressNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Progress", nil) image:imgProgress tag:0];
    
    //Set Objective tab
    ObjectiveViewController *objectiveView = [[ObjectiveViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *objectiveNav = [[UINavigationController alloc] initWithRootViewController:objectiveView];
    UIImage *imgObj = [UIImage imageNamed:@"obiective_2x.png"];
    objectiveNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Objective", nil) image:imgObj tag:0];
    
    //Set Profile tab
    ProfileViewController *profileView = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileView];
    UIImage *imgProfile = [UIImage imageNamed:@"profile_2x.png"];
    profileNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Profile", nil) image:imgProfile tag:0];
    
    FeedViewController *feedView = [[FeedViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *feedNav = [[UINavigationController alloc] initWithRootViewController:feedView];
    UIImage *imgfeed = [UIImage imageNamed:@"feed_2x.png"];
    feedNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Feed", nil) image:imgfeed tag:0];
    
    
    NSArray *viewControllerArray = [NSArray arrayWithObjects:activitiesNav, feedNav, objectiveNav, progressNav, profileNav , nil];
    
    return viewControllerArray;
    
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
