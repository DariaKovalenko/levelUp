//
//  Person+CoreDataProperties.m
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic firstname;
@dynamic lastname;
@dynamic address;

@end
