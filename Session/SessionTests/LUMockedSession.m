//
//  LUMockedSession.m
//  Session
//
//  Created by Daria on 6/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUMockedSession.h"
@interface LUMockedSession ()

@end

@implementation LUMockedSession

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    self.targetRequest = request;
    NSURLResponse *testResponse = [[NSHTTPURLResponse alloc] initWithURL:request.URL statusCode:self.testStatusCode HTTPVersion:@"1.0" headerFields:nil];
    
    completionHandler(self.testData, testResponse, self.testError);
    
    return nil;
}

@end
