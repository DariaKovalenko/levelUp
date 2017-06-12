//
//  LUNetworkManager.h
//  Session
//
//  Created by Daria on 6/5/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDKUser;

typedef void (^LUResultErrorBlock)(id result, NSError *error);

@interface LUNetworkManager : NSObject

@property (nonatomic, strong) PDKUser *user;
- (instancetype)initWithSession:(NSURLSession *)session;

- (void)authenticateUserWithViewController:(UIViewController *)viewController completion:(LUResultErrorBlock)completion;

- (void)loadBoardWithCompletion:(LUResultErrorBlock)completion;

- (void)postBoardsWithName:(NSString *)name description:(NSString *)desription;
@end
