//
//  AppDelegate.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabbar;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // For initialize GlobalGDXData class
    [GlobalGDXData sharedData];

    // ****************************************************************************
    tabbar = [[UITabBarController alloc] init];
    [tabbar setDelegate:self];
    // ****************************************************************************

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

-(void)redirectHomeController
{
    //UITabBarController *tabbar = [[UITabBarController alloc] init];
    //tabbar.viewControllers = hom
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    vc1.title = @"Home";
    vc1.tabBarItem.tag = 0;
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home.png"];
    //vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected.png"];
    
    
    NetworkViewController *vc2= [storyboard instantiateViewControllerWithIdentifier:@"NetworkViewController"];
    vc2.title = @"My Network";
    vc2.tabBarItem.tag = 1;
    vc2.tabBarItem.image = [UIImage imageNamed:@"MyNetwork.png"];
    //vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected.png"];
    
    
    MessageViewController *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"MessageViewController"];
    vc3.title = @"Messaging";
    vc3.tabBarItem.tag = 2;
    vc3.tabBarItem.image = [UIImage imageNamed:@"Message.png"];
    
    
    NotificationViewController *vc4 = [storyboard instantiateViewControllerWithIdentifier:@"NotificationViewController"];
    vc4.title = @"Notification";
    vc4.tabBarItem.tag = 4;
    vc4.tabBarItem.image = [UIImage imageNamed:@"Notification.png"];
    
    
    ProfileViewController *vc5 = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    vc3.tabBarItem.tag = 5;
    vc5.title = @"Me";
    vc5.tabBarItem.image = [UIImage imageNamed:@"Jobs.png"];
    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    UINavigationController *navC5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    
    
    tabbar.viewControllers        = @[navC1, navC2, navC3, navC4, navC5];
    
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    
}
#pragma mark - Set Border
-(void)setBorderToView:(UIView *)view withBorderWidth:(float)width radious:(float)radious color:(UIColor *)bordercolor
{
    view.layer.borderWidth = width;
    view.layer.borderColor = [bordercolor CGColor];
    view.layer.cornerRadius = radious;
    view.layer.masksToBounds = YES;
}


@end
