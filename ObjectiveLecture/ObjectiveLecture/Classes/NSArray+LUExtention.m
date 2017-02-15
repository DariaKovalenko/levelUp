//
//  NSArray+LUExtention.m
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "NSArray+LUExtention.h"

@implementation NSArray (LUExtention)

- (void)printFirstPerson {
    LUPerson *person = [self firstObject];
    if ([person isMemberOfClass:[LUPerson class]]) {
        NSLog(@"%@", person);
    }
}

@end
