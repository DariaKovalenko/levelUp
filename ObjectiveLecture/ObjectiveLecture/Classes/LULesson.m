//
//  LULesson.m
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LULesson.h"

@interface LULesson ()

@property (nonatomic, assign) BOOL passed;

@end

@implementation LULesson

- (void)printObject {
    NSLog(@"%@ %@", self, self.title);
}

- (void)lalala {
    self.passed = true;
    
    if (self.isPassed) {
        NSLog(@"lalal");
    }
}

@end
