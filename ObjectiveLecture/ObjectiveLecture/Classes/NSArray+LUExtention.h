//
//  NSArray+LUExtention.h
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUPerson.h"

typedef BOOL (^LUPersonFilter)(LUPerson *person);

@interface NSArray (LUExtention)

- (void)printFirstPerson;

- (void)enumeratePersonsUsingBlock:(void (^)(LUPerson *person, NSInteger index))block;

- (NSArray *)filteredPersonsUsingBlock:(LUPersonFilter)block;

@end
