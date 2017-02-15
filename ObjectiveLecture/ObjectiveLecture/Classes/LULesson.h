//
//  LULesson.h
//  ObjectiveLecture
//
//  Created by Daria on 2/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUPrinter.h"

@interface LULesson : NSObject <LUPrinter>
@property (nonatomic, copy) NSString *title;

@end
