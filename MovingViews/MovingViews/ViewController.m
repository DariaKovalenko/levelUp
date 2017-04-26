//
//  ViewController.m
//  MovingViews
//
//  Created by Daria on 4/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "MovableView.h"

//static const CGFloat LUViewOffset = 20;


@interface ViewController () <MovableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView.layer.masksToBounds = YES;
}

- (IBAction)addView:(id)sender {
    MovableView *movableView = [MovableView view];
    movableView.delegate = self;
    CGSize containerSize = self.containerView.frame.size;
    movableView.center = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    [self.containerView addSubview:movableView];
}

#pragma mark - MovableView delegate

- (BOOL)movableViewShouldPan:(MovableView *)movableView withTransform:(CGAffineTransform)transform {
    NSLog(@"movableView frame %@ %@ %@ %@", @(movableView.frame.origin.x), @(movableView.frame.origin.y), @(transform.tx), @(transform.ty));
    
    CGSize containerSize = self.containerView.frame.size;
    CGPoint center = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    CGPoint targetPoint = CGPointApplyAffineTransform(center, transform);

    return (targetPoint.x > 0 && targetPoint.y > 0 && targetPoint.x < containerSize.width && targetPoint.y < containerSize.height);
}

- (void)movableViewIsRemoved:(MovableView *)movableView {
    UIAlertController *alertView = [UIAlertController  alertControllerWithTitle:@"You did remove view" message:@"Are you shoure" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
}

- (void)movableViewDidLongPress:(MovableView *)movableView {
    UIAlertController *alertView = [UIAlertController  alertControllerWithTitle:@"You want to remove this view" message:@"Are you shoure" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [movableView removeFromSuperview];
    }]];
    
    [alertView addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertView animated:YES completion:nil];
}

@end
