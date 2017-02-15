//
//  LUPerson.m
//  ObjectiveLecture
//
//  Created by Daria on 2/14/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPerson.h"
#import "NSString+LUExtentions.h"

@interface LUPerson () {
    NSInteger userAge;
}

@end

@implementation LUPerson

@dynamic fullName;

- (instancetype)initWithAge:(NSInteger)age {
    self = [super init];
    if (self) {
        _dict = @{ @"key1" : @"lalala",
                   @"key2" : @"lololo"
                   };
        userAge = age;
    }
    
    return self;
}

- (void)setFirstName:(NSString *)firstName {
    _firstName = firstName.uppercasedValue;
}

- (void)printKeys {
    NSArray *key1 = self.dict[@"key1"];
    id key2 = [self.dict objectForKey:@"key2"];
    NSLog(@"%@ %@", key1, key2);
}

- (void)printObject {
    NSLog(@"%@ %@", self, self.fullName);
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.lastName, self.firstName];
}

@end
