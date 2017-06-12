//
//  NSDictionary+LUExtensions.m
//  Session
//
//  Created by Daria on 6/7/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "NSDictionary+LUExtensions.h"

@implementation NSDictionary (LUExtensions)

- (NSString *)stringValueForKey:(NSString *)key {
    id value = self[key];
    return ([value isKindOfClass:[NSString class]]) ? value: nil;
}

@end
