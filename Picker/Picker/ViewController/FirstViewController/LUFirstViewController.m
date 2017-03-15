//
//  LUFirstViewController.m
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUFirstViewController.h"

@interface LUFirstViewController ()

@end

@implementation LUFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    segue.destinationViewController.title = sender;
}

- (IBAction)showNext:(id)sender {
    NSString *senderString = @"SOME STRING FOR SEGUE";
    [self performSegueWithIdentifier:@"ShowNext" sender:senderString];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
