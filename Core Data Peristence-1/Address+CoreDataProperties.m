//
//  Address+CoreDataProperties.m
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Address+CoreDataProperties.h"

@implementation Address (CoreDataProperties)

+ (NSFetchRequest<Address *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Address"];
}

@dynamic country;
@dynamic city;
@dynamic street;
@dynamic code;
@dynamic persons;

@end
