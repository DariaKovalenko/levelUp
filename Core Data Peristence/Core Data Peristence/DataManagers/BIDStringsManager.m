//
//  BIDStringsManager.m
//  Core Data Peristence
//
//  Created by Daria on 5/24/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "BIDStringsManager.h"
#import "BIDDataController.h"

static NSString * const kLineEntityName = @"Line";
NSString * const kLineNumberKey = @"lineNumber";
NSString * const kLineTextKey = @"lineText";

@implementation BIDStringsManager

- (NSArray *)managedObjects {
    NSManagedObjectContext *context = [[BIDDataController sharedInstanse] managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"There was an error!");
    }
    
    return objects;
}

- (void)saveStrings:(NSArray *)strings {
    BIDDataController *dataController = [BIDDataController sharedInstanse];
    NSManagedObjectContext *context = [dataController managedObjectContext];
    
    NSError *error = nil;
    for (int i = 0; i < 4; i++) {
        NSString *text = strings[i];
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(%K = %d)", kLineNumberKey, i];
        [request setPredicate:pred];
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        if (objects == nil) {
            NSLog(@"There was an error!");
        }
        
        NSManagedObject *theLine = nil;
        if ([objects count] > 0) {
            theLine = [objects objectAtIndex:0];
        } else {
            theLine = [NSEntityDescription insertNewObjectForEntityForName:kLineEntityName inManagedObjectContext:context];
        }
        
        [theLine setValue:[NSNumber numberWithInt:i] forKey:kLineNumberKey];
        [theLine setValue:text forKey:kLineTextKey];
        
    }
    
    [dataController saveContext];
    
}

@end
