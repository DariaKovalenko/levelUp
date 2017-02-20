//
//  LUPerson.h
//  ObjectiveLecture
//
//  Created by Daria on 2/14/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUPrinter.h"

typedef enum {
    LUPersonMale = 0,
    LUPersonFemale
} LUPersonSex;

@interface LUPerson : NSObject <LUPrinter>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) NSDictionary *dict;

@property (nonatomic, assign) LUPersonSex sex;

@property id <LUPrinter> printer;

@property (nonatomic, weak) LUPerson *bestFriend;

@property (readonly) NSInteger age;
@property NSDate *date;
@property (readonly) NSString *fullName;

@end
