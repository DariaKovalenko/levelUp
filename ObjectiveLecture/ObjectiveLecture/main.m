//
//  main.m
//  ObjectiveLecture
//
//  Created by Daria on 2/14/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUPerson.h"
#import "NSArray+LUExtention.h"
#import "LUPrinter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        id <LUPrinter> object = [[LUPerson alloc] init];
        [object printObject];
        
        [object performSelector:@selector(printUppercased) withObject:nil];
        
        if ([object respondsToSelector:@selector(printUppercased)]) {
            [object printUppercased];
        }
        
        if ([object respondsToSelector:@selector(setupWithString:andNumber:)]) {
            [object setupWithString:@"strign" andNumber:@(4)];
        }
        
        LUPerson *person = [[LUPerson alloc] init];
        
        NSArray *persons = [NSArray arrayWithObject:person];
        [persons printFirstPerson];
    }
    
    return 0;
}
