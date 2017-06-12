//
//  AppDelegate.m
//  Session
//
//  Created by Daria on 6/5/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "AppDelegate.h"
#import <PinterestSDK/PinterestSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[PDKClient sharedInstance] handleCallbackURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options {
    return [[PDKClient sharedInstance] handleCallbackURL:url];
}

@end
