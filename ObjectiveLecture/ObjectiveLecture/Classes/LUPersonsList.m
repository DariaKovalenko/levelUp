//
//  LUPersonsList.m
//  ObjectiveLecture
//
//  Created by Daria on 2/20/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPersonsList.h"
#import "LUPerson.h"

@implementation LUPersonsList

- (void)addPersons:(NSArray <LUPerson *> *)persons {
    for (LUPerson *person in persons) {
        if (self.filterBlock(person)) {
            NSLog(@"%@", person.fullName);
        }
    }
}

@end
