//
//  LUPerson.h
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUPerson : NSObject
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

+ (LUPerson *)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
