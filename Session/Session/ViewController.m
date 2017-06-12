//
//  ViewController.m
//  Session
//
//  Created by Daria on 6/5/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import <PinterestSDK/PinterestSDK.h>

#import "LUNetworkManager.h"

@interface ViewController ()
@property (nonatomic, strong) LUNetworkManager *networkManager;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.networkManager = [LUNetworkManager new];
    
    [[PDKClient sharedInstance] silentlyAuthenticatefromViewController:self withSuccess:^(PDKResponseObject *responseObject) {
        self.networkManager.user = [responseObject user];
    } andFailure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (IBAction)loginUser:(id)sender {
    [self.networkManager authenticateUserWithViewController:self completion:^(id result, NSError *error) {
        
    }];
}

- (IBAction)getBoards:(id)sender {
    [self.networkManager loadBoardWithCompletion:^(id result, NSError *error) {
        
    }];
}
- (IBAction)createBoard:(id)sender {
    [self.networkManager postBoardsWithName:self.nameField.text description:self.descriptionField.text];
}

@end
