//
//  AppDelegate.m
//  RossMobile
//
//  Created by Piotrek on 9/11/12.
//
//

#import "AppDelegate.h"

// View Controllers
#import "WallViewController.h"
#import "PromotionsTableViewController.h"
#import "MapViewController.h"
#import "VirtualFashionViewController.h"
#import "LoggedAreaViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self configureTabbar];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)configureTabbar {
    WallViewController *wallViewController = [[WallViewController alloc] init];
    PromotionsTableViewController *promotionsTableViewController = [[PromotionsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    MapViewController *mapViewController = [[MapViewController alloc] init];
    VirtualFashionViewController *virtualFashionViewController = [[VirtualFashionViewController alloc] init];
    LoggedAreaViewController *loggedAreaViewController = [[LoggedAreaViewController alloc] init];
        
    UINavigationController *wallNavigationController;
    UINavigationController *promotionsNavigationController;
    UINavigationController *mapNavigationController;
    UINavigationController *virtualFashionNavigationController;
    UINavigationController *loggedAreaFashionNavigationController;
    
    wallNavigationController = [[UINavigationController alloc] initWithRootViewController:wallViewController];
    [wallNavigationController.tabBarItem setTitle:NSLocalizedString(@"Wall", nil)];
    [wallNavigationController.tabBarItem setImage:[UIImage imageNamed:@"wall"]];
    
    promotionsNavigationController = [[UINavigationController alloc] initWithRootViewController:promotionsTableViewController];
    [promotionsNavigationController.tabBarItem setTitle:NSLocalizedString(@"Promotions", nil)];
    [promotionsNavigationController.tabBarItem setImage:[UIImage imageNamed:@"promotions"]];
    
    mapNavigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    [mapNavigationController.tabBarItem setTitle:NSLocalizedString(@"Map", nil)];
    [mapNavigationController.tabBarItem setImage:[UIImage imageNamed:@"map"]];
    
    virtualFashionNavigationController = [[UINavigationController alloc] initWithRootViewController:virtualFashionViewController];
    [virtualFashionNavigationController.tabBarItem setTitle:NSLocalizedString(@"Virtual", nil)];
    [virtualFashionNavigationController.tabBarItem setImage:[UIImage imageNamed:@"virtual_fashion"]];
    
    loggedAreaFashionNavigationController = [[UINavigationController alloc] initWithRootViewController:loggedAreaViewController];
    [loggedAreaFashionNavigationController.tabBarItem setTitle:NSLocalizedString(@"Logged Area", nil)];
    [loggedAreaFashionNavigationController.tabBarItem setImage:[UIImage imageNamed:@"logged_area"]];
    
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setViewControllers: [NSArray arrayWithObjects:
                                                wallNavigationController,
                                                promotionsNavigationController,
                                                mapNavigationController,
                                                virtualFashionNavigationController,
                                                loggedAreaFashionNavigationController,
                                                    nil]];
}

@end
