//
//  BIDAppDelegate.m
//  Core Data Peristence
//

#import "BIDAppDelegate.h"
#import "BIDViewController.h"
#import "BIDDataController.h"
#import "StoreController.h"

@interface BIDAppDelegate ()
@property (nonatomic, strong) StoreController *storeController;

@end
@implementation BIDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.storeController = [[StoreController alloc] initWithCompletionBlock2:^{
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        // Override point for customization after application launch.
        
        BIDViewController *controller = [[BIDViewController alloc] init];
        UINavigationController *navigationController =[[UINavigationController alloc] initWithRootViewController:controller];
        
        self.window.rootViewController = navigationController;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
//    }];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[BIDDataController sharedInstanse] saveContext];
}

@end
