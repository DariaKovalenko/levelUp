//
//  LUTabbarViewController.m
//  NavigationControllers
//
//  Created by Daria on 3/24/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUTabbarViewController.h"
#import "UIStoryboard+LUExtention.h"

@interface LUTabbarViewController ()
@property (nonatomic, strong) UIViewController *firstViewController;
@property (nonatomic, strong) UIViewController *secondViewController;

@end

@implementation LUTabbarViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeControllers];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initializeControllers];
    }
    return self;
}

- (void)initializeControllers {
//    self.firstViewController = [[UIStoryboard mainFlow] instantiateInitialViewController];
//    self.secondViewController = [[UIStoryboard profile] instantiateInitialViewController];
//    self.viewControllers = @[self.firstViewController, self.secondViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
}

@end
