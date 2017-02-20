//
//  LUPersonsList.h
//  ObjectiveLecture
//
//  Created by Daria on 2/20/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LUPerson;

typedef BOOL (^PersonFilter)(LUPerson *person);

@interface LUPersonsList : NSObject
@property (nonatomic, copy) PersonFilter filterBlock;

@end
