//
//  ViewController.m
//  Gestures
//
//  Created by Daria on 4/24/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    
}
- (IBAction)didAnotherTap:(UITapGestureRecognizer *)sender {
    
}

- (IBAction)didTapOnPink:(UITapGestureRecognizer *)sender {

}
- (IBAction)didPan:(UIPanGestureRecognizer *)sender {
    
}



#pragma mark - Gesture Recognizer Delegate methdos 

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer {
    return YES;

}

@end
