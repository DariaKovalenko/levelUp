//
//  Person+DataManagerExtensions.h
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Person+CoreDataClass.h"
#import "Person+CoreDataProperties.h"

@interface Person (DataManagerExtensions)

+ (NSArray *)persons;
+ (Person *)personWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

- (void)updateWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;
- (void)remove;

- (void)updateAddressWithCountry:(NSString *)country
                            city:(NSString *)city
                          street:(NSString *)street
                            code:(NSString *)code;

@end
