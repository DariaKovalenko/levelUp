//
//  LUThirdViewController.m
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUThirdViewController.h"

@interface LUThirdViewController ()

@end

@implementation LUThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *viewController = [UIViewController new];
    [self.view addSubview:viewController.view];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToSomeController {
    UINavigationController *navigationController = self.navigationController;
    if ([navigationController viewControllers].count > 2) {
        UIViewController *mainController = [self.navigationController viewControllers][1];
        [navigationController popToViewController:mainController animated:YES];
    }
}

@end
