//
//  Address+CoreDataProperties.h
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Address+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Address (CoreDataProperties)

+ (NSFetchRequest<Address *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *street;
@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, retain) NSSet<Person *> *persons;

@end

@interface Address (CoreDataGeneratedAccessors)

- (void)addPersonsObject:(Person *)value;
- (void)removePersonsObject:(Person *)value;
- (void)addPersons:(NSSet<Person *> *)values;
- (void)removePersons:(NSSet<Person *> *)values;

@end

NS_ASSUME_NONNULL_END
