//
//  LUBoard.m
//  Session
//
//  Created by Daria on 6/7/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUBoard.h"
#import "APIConstants.h"


@implementation LUBoard

+ (NSArray *)boardsWithJSON:(NSDictionary *)jsonDictionary {
    NSArray *jsons = jsonDictionary[@"data"];
    if (![jsons isKindOfClass:[NSArray class]]) return nil;
    
    NSMutableArray *boards = [NSMutableArray array];
    for (NSDictionary *dict in jsons) {
        [boards addObject:[self boardWithJSON:dict]];
    }
    
    return [boards copy];
}

+ (LUBoard *)boardWithJSON:(NSDictionary *)jsonDictionary {
    LUBoard *board = [LUBoard new];
    
    id boardIDValue = jsonDictionary[LUAPIKeyBoardID];
    if ([boardIDValue respondsToSelector:@selector(integerValue)]) {
        board.boardID = [boardIDValue integerValue];
    }
    
    id nameValue = jsonDictionary[LUAPIKeyName];
    if ([nameValue isKindOfClass:[NSString class]]) {
        board.name = nameValue;
    }
    
    id descriptionValue = jsonDictionary[LUAPIKeyDescription];
    if ([nameValue isKindOfClass:[NSString class]]) {
        board.boardDescription = descriptionValue;
    }
    
    id imageValue = jsonDictionary[LUAPIKeyImage];
    if ([nameValue isKindOfClass:[NSString class]]) {
        board.imageName = imageValue;
    }
    
    return board;
}

- (NSString *)description {
    return [[super description] stringByAppendingFormat:@" boardID: %ld name: %@ destription: %@", self.boardID, self.name, self.boardDescription];
}


@end
