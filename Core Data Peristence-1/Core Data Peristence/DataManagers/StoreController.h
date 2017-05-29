//
//  StoreController.h
//  Core Data Peristence
//
//  Created by Daria on 5/24/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VoidBlock)(void);

@interface StoreController : NSObject
@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

- (id)initWithCompletionBlock:(VoidBlock)callback;

- (id)initWithCompletionBlock2:(VoidBlock)callback;
@end
