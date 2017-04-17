//
//  LUPerson.m
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPerson.h"

@implementation LUPerson

+ (LUPerson *)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    return [[LUPerson alloc] initWithFirstName:firstName lastName:lastName];
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

@end
