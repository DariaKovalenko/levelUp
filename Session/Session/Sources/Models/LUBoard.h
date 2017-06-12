//
//  LUBoard.h
//  Session
//
//  Created by Daria on 6/7/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUBoard : NSObject
@property (nonatomic, assign) NSInteger boardID;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *boardDescription;

+ (NSArray *)boardsWithJSON:(NSDictionary *)jsonDictionary;
+ (LUBoard *)boardWithJSON:(NSDictionary *)jsonDictionary;

@end
