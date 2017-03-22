//
//  ModalViewController.m
//  NavigationControllers
//
//  Created by Daria on 3/22/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (strong, nonatomic) IBOutlet UILabel *senderLabel;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.senderLabel.text = self.senderTitle ?: @"";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
