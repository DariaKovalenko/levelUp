//
//  ViewController.m
//  SettingsApp
//
//  Created by Daria on 5/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "NSUserDefaults+LUExtensions.h"
#import <SAMKeychain/SAMKeychain.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL isShownTutorial =  [NSUserDefaults standardUserDefaults].isTutorialShown;
    if (!isShownTutorial) {
        [self updateIsShown];
    }
    
    self.view.backgroundColor = [NSUserDefaults standardUserDefaults].isTutorialShown ? [UIColor blackColor] : [UIColor whiteColor];
    
    [NSUserDefaults resetStandardUserDefaults];
    
    NSError *error = nil;
    SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
    query.service = @"MyService";
    query.account = @"soffes";
    [query fetch:&error];
    
    if ([error code] == errSecItemNotFound) {
        NSLog(@"Password not found");
    } else if (error != nil) {
        NSLog(@"Some other error occurred: %@", [error localizedDescription]);
    }
}

- (void)updateIsShown {
    [NSUserDefaults standardUserDefaults].isTutorialShown = YES;
    
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:@"isTurorialShown"];
    BOOL hasValue = [object respondsToSelector:@selector(boolValue)] && [object boolValue];
}


@end
