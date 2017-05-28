//
//  StoreController.m
//  Core Data Peristence
//
//  Created by Daria on 5/24/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "StoreController.h"

@interface StoreController()

@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation StoreController

- (id)initWithCompletionBlock:(VoidBlock)callback {
    self = [super init];
    if (!self) return nil;
    
    self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Core_Data_Peristence"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
        callback();
    }];
    
    return self;
}

- (id)initWithCompletionBlock2:(VoidBlock)callback {
    self = [super init];
    
    if (!self) return nil;
    
    //This resource is the same name as your xcdatamodeld contained in your project
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Core_Data_Peristence" withExtension:@"momd"];
    NSAssert(modelURL, @"Failed to locate momd bundle in application");
    
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(managedObjectModel, @"Failed to initialize mom from URL: %@", modelURL);
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    [self setManagedObjectContext:managedObjectContext];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[self managedObjectContext] persistentStoreCoordinator];
        NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Core_Data_Peristence.sqlite"];
        
        NSError *error = nil;
        NSPersistentStore *store = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                             configuration:nil
                                                                       URL:storeURL
                                                                   options:nil
                                                                                    error:&error];
        if (!store) {
            NSLog(@"Failed to initalize persistent store: %@\n%@", [error localizedDescription], [error userInfo]);
            abort();
        }
        if (!callback) {
            return;
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            callback();
        });
    });
    
    return self;
}

@end
