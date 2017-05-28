//
//  BIDStringsManager.h
//  Core Data Peristence
//
//  Created by Daria on 5/24/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLineNumberKey;
extern NSString * const kLineTextKey;

@interface BIDStringsManager : NSObject

- (NSArray *)managedObjects;
- (void)saveStrings:(NSArray *)strings;

@end
