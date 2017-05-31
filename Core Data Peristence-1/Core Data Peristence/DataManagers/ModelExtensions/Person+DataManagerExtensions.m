//
//  Person+DataManagerExtensions.m
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Person+DataManagerExtensions.h"
#import "BIDDataController.h"
#import "Address+BIDataManagerExtensions.h"

static NSString * const kPerson = @"Person";

@implementation Person (DataManagerExtensions)

+ (NSArray *)persons {
    NSManagedObjectContext *context = [[BIDDataController sharedInstanse] managedObjectContext];
    
    NSError *error = nil;
    
    NSFetchRequest *request = [self fetchRequest];
    //    request.predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"firstname", @"Anna"];
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (objects == nil) {
        NSLog(@"There was an error!");
    }
    
    return objects;
}

+ (Person *)personWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    BIDDataController *dataController = [BIDDataController sharedInstanse];
    NSManagedObjectContext *context = [dataController managedObjectContext];
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:kPerson inManagedObjectContext:context];
    [person updateWithFirstName:firstName andLastName:lastName];
    
    return person;
}

- (void)updateWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    self.firstname = firstName;
    self.lastname = lastName;
    [[BIDDataController sharedInstanse] saveContext];
}

- (void)remove {
    BIDDataController *dataController = [BIDDataController sharedInstanse];
    [dataController.managedObjectContext deleteObject:self];
    [dataController saveContext];
}

- (void)updateAddressWithCountry:(NSString *)country
                            city:(NSString *)city
                          street:(NSString *)street
                            code:(NSString *)code
{
    Address *address = self.address;
    if (!address || (!([address.city isEqualToString:city] && [address.country isEqualToString:country] && [address.code isEqualToString:code] && [address.street isEqualToString:street]))) {
        [address removePersonsObject:self];
        Address *newAddress = [Address addressWithCountry:country city:city street:street code:code];
        [newAddress addPersonsObject:self];
        [[BIDDataController sharedInstanse] saveContext];
    }
}


@end
