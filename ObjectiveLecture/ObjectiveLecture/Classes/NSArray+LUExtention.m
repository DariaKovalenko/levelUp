//
//  NSArray+LUExtention.m
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "NSArray+LUExtention.h"
#import "LUPerson.h"

@implementation NSArray (LUExtention)

- (void)printFirstPerson {
    LUPerson *person = [self firstObject];
    if ([person isMemberOfClass:[LUPerson class]]) {
        NSLog(@"%@", person);
    }
}

- (void)enumeratePersonsUsingBlock:(void (^)(LUPerson *, NSInteger index))block {
    for (NSInteger index = 0; index < self.count; index++) {
        LUPerson *person = self[0];
        block(person, index);
    }
}

- (NSArray *)filteredPersonsUsingBlock:(BOOL (^)(LUPerson *person))block {
    NSMutableArray *filteredPersons = [NSMutableArray array];
    for (LUPerson *person in self) {
        BOOL isConditionConfirmed = block(person);
        if (isConditionConfirmed) {
            [filteredPersons addObject:person];
        }
    }
    
    return [filteredPersons copy];
}

// ReturnType (^)(LUPerson *, NSInteger index)

@end
