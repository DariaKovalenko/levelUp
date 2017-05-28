//
//  BIDDataController.h
//  Core Data Peristence
//
//  Created by Daria on 5/23/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDDataController : NSObject

+ (BIDDataController *)sharedInstanse;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
