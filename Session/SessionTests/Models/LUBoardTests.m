//
//  LUBoardTests.m
//  Session
//
//  Created by Daria on 6/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LUBoard.h"

@interface LUBoardTests : XCTestCase

@end

@implementation LUBoardTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testArraysWithJSON {
    //Step1 Prepare data
    NSData *data = [self testData];
    NSError *error = nil;
    id dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error != nil || dict == nil) {
        XCTFail(@"No serialized data");
        return;
    }
//        NSLog(@"%@", data);
//    
//    NSDictionary *dict = @{ @"data" : @[
//                                    @{
//                                        @"description" : @"lalala",
//                                        @"name" : @"Cooking",
//                                        @"id" : @"432767914132046582",
//                                        @"image" :             @{
//                                                @"60x60" :                 @{
//                                                        @"height" : @60,
//                                                        @"url" : @"https://s-media-cache-ak0.pinimg.com/60x60/42/85/72/4285723114742afcf173be28d917c463.jpg",
//                                                        @"width" : @60
//                                                        },
//                                                }
//                                        },
//                                    @{
//                                        @"description" : @"lololo",
//                                        @"name" : @"Beaty",
//                                        @"id" : @"432767914132046588",
//                                        @"image" :             @{
//                                                @"60x60" :                 @{
//                                                        @"height" : @60,
//                                                        @"url" : @"https://s-media-cache-ak0.pinimg.com/60x60/42/85/72/4285723114742afcf173be28d917c463.jpg",
//                                                        @"width" : @60
//                                                        },
//                                                }
//                                        }
//                                    
//                                    ]};
    
    // Step 2 Perform some action
    
    NSArray *boards = [LUBoard boardsWithJSON:dict];
    
    // Step 3 check results
    
    XCTAssertTrue(boards.count == 2);
    LUBoard *board = [boards firstObject];
    XCTAssertEqualObjects(board.boardDescription, @"lalala");
    XCTAssertTrue(board.boardID == 432767914132046582);
    XCTAssertEqualObjects(board.name, @"Cooking");
    XCTAssertTrue(board.imageName, @"https://s-media-cache-ak0.pinimg.com/60x60/42/85/72/4285723114742afcf173be28d917c463.jpg");
    
    
}

- (NSData *)testData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BoardsResponseJSON" ofType:@"txt"];
    
    return [NSData dataWithContentsOfFile:filePath];
}

@end
