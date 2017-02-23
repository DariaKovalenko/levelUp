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
#import "LUPersonsList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        NSArray *array = @[];
        @try
        {
            
            NSString *string = array.count > 10 ? [array objectAtIndex:10] : nil;
        }
        @catch (NSException *exception)
        {
            NSLog(@"%@ ",exception.name);
            NSLog(@"Reason: %@ ",exception.reason);
        }
        @finally
        {
            NSLog(@"@@finaly Always Executes");
        }
        
        
        id <LUPrinter> object = [[LUPerson alloc] init];
        [object printObject];
        
//        [object performSelector:@selector(printUppercased) withObject:nil];
        
        if ([object respondsToSelector:@selector(printUppercased)]) {
            [object printUppercased];
        }
        
        
        if ([object respondsToSelector:@selector(setupWithString:andNumber:)]) {
            [object setupWithString:@"strign" andNumber:@(4)];
        }
        
        LUPerson *person = [[LUPerson alloc] init];
        
        NSArray *persons = @[person, [LUPerson new], [LUPerson new]];
        NSMutableArray <LUPerson *> *personsToChange =[@[] mutableCopy];
        [personsToChange addObject:person];
        
        NSString *lala = nil;
        [@"lalal" isEqualToString:lala];
        
        [[persons copy] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LUPerson *person = (LUPerson *)obj;
            if (person.age < 16) {
                *stop = true;
            }
        }];
        
        id eachObject = nil;
        NSEnumerator *enumertator = [persons objectEnumerator];
        while ((eachObject = [enumertator nextObject])) {
            NSLog(@"Current object is: %@", eachObject);
        }
        
        __block NSInteger variableToSet = 4;
        
        [persons enumerateObjectsUsingBlock:^(LUPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"object %@", obj);
            variableToSet = 5;
        }];
        
        NSMutableArray *smallPersons = [NSMutableArray array];
        for (LUPerson *person in persons) {
            if (person.age < 16) {
                [smallPersons addObject:person];
            }
        }
        
        NSArray *smallPersons2 = [persons filteredPersonsUsingBlock:^BOOL(LUPerson *person) {
            return person.age < 16;
        }];
        
        NSLog(@"%@", smallPersons2);
        
        NSMutableArray *oldPersons = [NSMutableArray array];
        for (LUPerson *person in persons) {
            if (person.age < 70) {
                [oldPersons addObject:person];
            }
        }
        
        NSArray *oldPersons2 = [persons filteredPersonsUsingBlock:^BOOL(LUPerson *person) {
            return person.age > 70;
        }];
        
        [persons filteredPersonsUsingBlock:^BOOL(LUPerson *person) {
            return [person.fullName isEqualToString:@"Vasia Pupkin"];
        }];
        
        //переменная с блоком
        BOOL (^maleFilter)(LUPerson *) = ^BOOL(LUPerson *person) {
            return person.sex == LUPersonMale;
        };
        
        void (^enumeratorBlock)(LUPerson *, NSInteger) = ^(LUPerson *person, NSInteger index) {
            NSLog(@"%@", person);
        };
        
        //переменная с блоком, тип которого определен через typedef
        LUPersonFilter femaleFilter = ^(LUPerson *person) {
            return (BOOL)(person.sex == LUPersonFemale);
        };
        
        [persons filteredPersonsUsingBlock:femaleFilter];
        [persons enumeratePersonsUsingBlock:enumeratorBlock];
        
        NSArray *malePersons = [persons filteredPersonsUsingBlock:maleFilter];
        NSLog(@"%@", malePersons);
        
        NSLog(@"%@", oldPersons2);
        [persons printFirstPerson];
        
        
        [persons enumeratePersonsUsingBlock:^(LUPerson *person, NSInteger index) {
            NSLog(@"%@ index %ld", person, (long)index);
        }];
        
        LUPersonsList *personsList = [LUPersonsList new];
        personsList.filterBlock = ^(LUPerson *person) {
            return YES;
        };
    }
    
    return 0;
}
