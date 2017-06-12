//
//  LUNetworkManagerTests.m
//  Session
//
//  Created by Daria on 6/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LUNetworkManager.h"
#import "LUBoard.h"
#import "LUMockedSession.h"

@interface LUNetworkManagerTests : XCTestCase

@end

@implementation LUNetworkManagerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testBoardsSuccessResult {
    LUMockedSession *session = [LUMockedSession new];
    session.testStatusCode = 200;
    session.testData = [self testData];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Load result expectation"];
    LUNetworkManager *manager  = [[LUNetworkManager alloc] initWithSession:session];
    
    [manager loadBoardWithCompletion:^(id result, NSError *error) {
        [expectation fulfill];
        
        XCTAssertTrue([result isKindOfClass:[NSArray class]]);
        XCTAssertTrue([result count] == 2);
        XCTAssertTrue([[result objectAtIndex:0] isKindOfClass:[LUBoard class]]);
        XCTAssertTrue([[result objectAtIndex:1] isKindOfClass:[LUBoard class]]);
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (void)testBoardsNoSuccessResult {
    LUMockedSession *session = [LUMockedSession new];
    session.testStatusCode = 401;
    session.testData = [self testData];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Load failure expectation"];
    LUNetworkManager *manager  = [[LUNetworkManager alloc] initWithSession:session];
    
    [manager loadBoardWithCompletion:^(id result, NSError *error) {
        [expectation fulfill];
        
        XCTAssertNil(result);
    }];
    
    [self waitForExpectationsWithTimeout:0.1 handler:nil];
}

- (NSData *)testData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BoardsResponseJSON" ofType:@"txt"];
    
    return [NSData dataWithContentsOfFile:filePath];
}
@end
