//
//  Address+BIDataManagerExtensions.h
//  Core Data Peristence
//
//  Created by Daria on 5/31/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "Address+CoreDataClass.h"

@interface Address (BIDataManagerExtensions)

+ (Address *)addressWithCountry:(NSString *)country
                           city:(NSString *)city
                         street:(NSString *)street
                           code:(NSString *)code;

+ (NSArray *)allAddresses;

@end
