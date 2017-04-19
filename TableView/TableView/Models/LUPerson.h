//
//  LUPerson.h
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LUPerson;

typedef void (^LUPersonBlock)(LUPerson *);

@interface LUPerson : NSObject
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSDate *birthday;
@property (nonatomic, strong) NSString *about;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) UIImage *icon;

@property (nonatomic, copy) LUPersonBlock updateHandler;

+ (LUPerson *)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
