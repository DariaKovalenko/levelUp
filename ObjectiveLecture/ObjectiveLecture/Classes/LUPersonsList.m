//
//  LUPersonsList.m
//  ObjectiveLecture
//
//  Created by Daria on 2/20/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPersonsList.h"
#import "LUPerson.h"

#define Weakify(o) typeof(o) __weak weak##o = o

#define ScreenHeight 230

const NSInteger LUScreenHeight = 230;

@interface LUBlockClass : NSObject
@property (nonatomic, copy) VoidBlock emptyBlock;

@end

@implementation LUBlockClass



@end

@interface LUPersonsList ()
@property (nonatomic, copy) VoidBlock emptyBlock;
@property (nonatomic, strong) LUBlockClass *someObject;
@end

@implementation LUPersonsList

- (void)someMethod {
    NSError *error = [NSError errorWithDomain:@"com.myproje.network" code:NSURLErrorCancelled userInfo:nil];
    if (error.code != NSURLErrorCancelled) {
    
    }
    
    LUBlockClass *object = [LUBlockClass new];
    self.someObject = object;
    object.emptyBlock = ^{
        [self someBlockMethod];
    };
    
//    typeof(self) __weak weakSelf = self;
    Weakify(self);
    self.emptyBlock = ^{
        typeof(weakself) __strong self = weakself;
        [self someBlockMethod];
    };
}

- (void)someBlockMethod {
    
    
}

- (void)addPersons:(NSArray <LUPerson *> *)persons {
    for (LUPerson *person in persons) {
        id value = nil;
        if (self.filterBlock && self.filterBlock(person)) {
            NSLog(@"%@", person.fullName);
        }
    }
}



@end
