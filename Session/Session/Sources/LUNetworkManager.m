//
//  LUNetworkManager.m
//  Session
//
//  Created by Daria on 6/5/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUNetworkManager.h"
#import <PinterestSDK/PinterestSDK.h>
#import "LUBoard.h"

#define BlockWeakObject(o) __typeof(o) __weak
#define BlockStrongObject(o) __typeof(o) __strong
#define BlockWeakSelf BlockWeakObject(self)


static NSString * const kPinterestAPIPath = @"https://api.pinterest.com/v1";

static NSString * const kPinterestAPIKey = @"4904622470840987547";

@interface LUNetworkManager ()
@property (nonatomic, strong) NSURLSessionTask *currentTask;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LUNetworkManager

- (instancetype)init {
    return [self initWithSession:nil];
}

- (instancetype)initWithSession:(NSURLSession *)session {
    self = [super init];
    if (self) {
        _session = session ?: [NSURLSession sharedSession];
        [PDKClient configureSharedInstanceWithAppId:kPinterestAPIKey];
    }
    
    return self;
}
//
//- (NSURLSession *)session {
//    return _session ?: [NSURLSession sharedSession];
//}

- (void)authenticateUserWithViewController:(UIViewController *)viewController completion:(LUResultErrorBlock)completion {
    BlockWeakSelf weakSelf = self;
    [[PDKClient sharedInstance] authenticateWithPermissions:@[PDKClientReadPublicPermissions,
                                                              PDKClientWritePublicPermissions,
                                                              PDKClientReadRelationshipsPermissions,
                                                              PDKClientWriteRelationshipsPermissions] fromViewController:viewController
                                                withSuccess:^(PDKResponseObject *responseObject)
     {
         BlockStrongObject(weakSelf) self = weakSelf;
         self.user = [responseObject user];
         completion ? completion(nil, nil) : nil;
     } andFailure:^(NSError *error) {
         NSLog(@"authentication failed %@", error.localizedDescription);
         completion ? completion(nil, error) : nil;
     }];
}


- (void)loadBoardWithCompletion:(LUResultErrorBlock)completion {
    NSArray *fields = @[@"id", @"image", @"description", @"name"];
    NSString *pathFormat = [kPinterestAPIPath stringByAppendingPathComponent:@"me/boards?access_token=%@&fields=%@"];
    
    NSString *path = [NSString stringWithFormat:pathFormat, [PDKClient sharedInstance].oauthToken, [fields componentsJoinedByString:@","]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"GET";
    //    request.allHTTPHeaderFields = @{ @"content-type" : @"application/json" };
    //    NSDictionary *bodyParameters = @{
    //                                     @"access_token" : [PDKClient sharedInstance].oauthToken,
    //                                     @"fields" : [fields componentsJoinedByString:@","]
    //                                     };
    //    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyParameters options:NSJSONWritingPrettyPrinted error:nil];
    
    [self startTaskWithRequest:request parsedCompletion:^(id result, NSError *error) {
        if (completion) {
            completion([LUBoard boardsWithJSON:result], error);
        }
    }];
}

- (void)startTaskWithRequest:(NSURLRequest *)request parsedCompletion:(LUResultErrorBlock)completion {
    self.currentTask = [self.session dataTaskWithRequest:request
                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                           NSURLErrorCancelled
                                           id result = nil;
                                           if ([response isKindOfClass:[NSHTTPURLResponse class]] && [(NSHTTPURLResponse *)response statusCode] == 200 && data != nil) {
                                               NSError *error = nil;
                                               result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                                           }
                                           NSLog(@"%@", response);
                                           if (completion) {
                                               completion(result, error);
                                           }
                                       }];
    
    [self.currentTask resume];
}

- (void)postBoardsWithName:(NSString *)name description:(NSString *)desription {
    NSString *pathFormat = [kPinterestAPIPath stringByAppendingPathComponent:@"boards?access_token=%@&name=%@"];
    NSString *path = [NSString stringWithFormat:pathFormat, [PDKClient sharedInstance].oauthToken, name];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{ @"content-type" : @"application/json" };
    NSDictionary *bodyParameters = @{
                                     @"access_token" : [PDKClient sharedInstance].oauthToken,
                                     @"name" : name,
                                     @"description" : desription
                                     };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyParameters options:NSJSONWritingPrettyPrinted error:nil];
    
    self.currentTask = [self.session dataTaskWithRequest:request
                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
                                           id json = data != nil ? [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error] : nil;
                                           NSLog(@"%@", json);
                                           NSLog(@"%@", response);
                                       }];
    
    [self.currentTask resume];
}

@end


