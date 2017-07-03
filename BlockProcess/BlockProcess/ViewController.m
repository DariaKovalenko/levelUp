//
//  ViewController.m
//  BlockProcess
//
//  Created by Daria on 6/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"

@interface SomeSingletone : NSObject

+ (SomeSingletone *)sharedInstace;

@end

typedef void (^LUVoidBlock)(void);

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, copy) LUVoidBlock ownBlock;

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"!!!!!!!!!!!!!!! DEALLOC");
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonClicked:(id)sender {
    __weak typeof(self) weakSelf = self;
    [self someBlockMethod:^{
        __strong typeof(weakSelf) self = weakSelf;
        self.label.text = @"button clicked";
    }];
    
//    [UIView animateWithDuration:0.4 animations:^{
//        self.label.center = self.view.center;
//    }];
}


- (void)someBlockMethod:(LUVoidBlock)block {
    self.ownBlock = block;
    if (block) {
        block();
    }
}

@end
