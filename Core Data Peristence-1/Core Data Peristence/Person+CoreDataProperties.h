//
//  Person+CoreDataProperties.h
//  Core Data Peristence
//
//  Created by Daria on 5/29/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstname;
@property (nullable, nonatomic, copy) NSString *lastname;

@end

NS_ASSUME_NONNULL_END
