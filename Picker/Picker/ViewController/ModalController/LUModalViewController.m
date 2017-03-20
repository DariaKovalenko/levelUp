//
//  LUModalViewController.m
//  Picker
//
//  Created by Daria on 3/20/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUModalViewController.h"

@interface LUModalViewController ()

@end

@implementation LUModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
