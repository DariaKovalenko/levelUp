//
//  LUPrinter.h
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LUPrinter <NSObject>

@required
- (void)printObject;

@optional
- (void)printUppercased;

- (void)setupWithString:(NSString *)string andNumber:(NSNumber *)number;

@end
