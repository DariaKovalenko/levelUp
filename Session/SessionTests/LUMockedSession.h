//
//  LUMockedSession.h
//  Session
//
//  Created by Daria on 6/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUMockedSession : NSURLSession
@property (nonatomic, strong) NSData *testData;
@property (nonatomic, strong) NSError *testError;
@property (nonatomic, strong) NSURLRequest *targetRequest;
@property (nonatomic, assign) NSInteger testStatusCode;

@end
