//
//  LUCustomNavigationViewController.m
//  Picker
//
//  Created by Daria on 3/20/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUCustomNavigationViewController.h"

@interface LUCustomNavigationViewController ()

@end

@implementation LUCustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (IBAction)closeClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
