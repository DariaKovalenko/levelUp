//
//  BIDPersonViewController.h
//  Core Data Peristence
//
//  Created by Daria on 5/29/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

typedef void (^ObjectHandler)(id);

@interface BIDPersonViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;

@property (strong, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) IBOutlet UITextField *streetField;
@property (strong, nonatomic) IBOutlet UITextField *cityField;
@property (strong, nonatomic) IBOutlet UITextField *codeField;

@property (nonatomic, strong) Person *person;

@property (nonatomic, copy) ObjectHandler saveHandler;

- (IBAction)saveButtonClicked:(id)sender;

@end
