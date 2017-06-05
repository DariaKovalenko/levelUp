//
//  NSUserDefaults+LUExtensions.m
//  SettingsApp
//
//  Created by Daria on 5/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "NSUserDefaults+LUExtensions.h"

static NSString *tutorialKey = @"ShownTutorial";

@implementation NSUserDefaults (LUExtensions)

@dynamic isTutorialShown;

- (void)setIsTutorialShown:(BOOL)isTutorialShown {
    [self setBool:isTutorialShown forKey:tutorialKey];
    [self synchronize];
}

- (BOOL)isTutorialShown {
    return [self boolForKey:tutorialKey];
}

@end
