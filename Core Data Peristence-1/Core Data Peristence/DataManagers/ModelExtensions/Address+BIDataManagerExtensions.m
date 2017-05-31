//
//  Address+BIDataManagerExtensions.m
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Address+BIDataManagerExtensions.h"
#import "BIDDataController.h"

static NSString * const kAddress = @"Address";

@implementation Address (BIDataManagerExtensions)


+ (Address *)addressWithCountry:(NSString *)country
                           city:(NSString *)city
                         street:(NSString *)street
                           code:(NSString *)code
{
    BIDDataController *dataController = [BIDDataController sharedInstanse];
    NSManagedObjectContext *context = [dataController managedObjectContext];
    
    Address *address = [self storedAddressInContext:context withCountry:country city:city street:street code:code];
    if (!address) {
        address = [NSEntityDescription insertNewObjectForEntityForName:kAddress inManagedObjectContext:context];
        address.country = country;
        address.city = city;
        address.street = street;
        address.code = code;
        
        [dataController saveContext];
    }
    
    return address;
}

+ (Address *)storedAddressInContext:(NSManagedObjectContext *)context
                        withCountry:(NSString *)country
                               city:(NSString *)city
                             street:(NSString *)street
                               code:(NSString *)code
{
    NSError *error = nil;
    NSFetchRequest *request = [self fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"country == %@ AND city == %@ AND street == %@ AND code == %@", country, city, street, code];
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    return objects.firstObject;
}

+ (NSArray *)allAddresses {
    NSManagedObjectContext *context = [[BIDDataController sharedInstanse] managedObjectContext];
    
    NSError *error = nil;
    NSFetchRequest *request = [self fetchRequest];
//    request.predicate = [NSPredicate predicateWithFormat:@"country == %@ AND city == %@ AND street == %@ AND code == %@", country, city, street, code];
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    return objects;
}

@end
