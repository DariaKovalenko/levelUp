//
//  ViewController.m
//  NavigationControllers
//
//  Created by Daria on 3/22/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "AnotherModalViewController.h"

static NSString *LUShowModalSegue = @"ShowModal";

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:LUShowModalSegue] && [sender isKindOfClass:[NSString class]]) {
        [(ModalViewController *)[segue destinationViewController] setSenderTitle:sender];
    }
}
- (IBAction)showAnotherModal:(id)sender {
    AnotherModalViewController *modalViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([AnotherModalViewController class])];
    modalViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    modalViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:modalViewController animated:YES completion:nil];
}

- (IBAction)showModalSegueClicked:(id)sender {
    [self performSegueWithIdentifier:LUShowModalSegue sender:@"Some title"];
}

- (IBAction)showModalProgrammaticallyClicked:(id)sender {
    ModalViewController *modalViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ModalViewController class])];
    modalViewController.senderTitle = @"Programmatically clicked";
    [self presentViewController:modalViewController animated:YES completion:nil];
}

@end
