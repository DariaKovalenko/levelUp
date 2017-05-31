//
//  BIDPersonViewController.m
//  Core Data Peristence
//
//  Created by Daria on 5/29/17.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "BIDPersonViewController.h"
#import "Person+DataManagerExtensions.h"
#import "Address+BIDataManagerExtensions.h"
#import "Address+CoreDataProperties.h"
#import "BIDDataController.h"

@interface BIDPersonViewController ()
@end

@implementation BIDPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillWithPerson:self.person];
}

- (void)fillWithPerson:(Person *)person {
    self.firstNameField.text = self.person.firstname;
    self.lastNameField.text = self.person.lastname;
    Address *address = person.address;
    if (address) {
        self.cityField.text = address.city;
        self.countryField.text = address.country;
        self.codeField.text = address.code;
        self.streetField.text = address.street;
    }
}

- (IBAction)saveButtonClicked:(id)sender {
    NSString *firstName = self.firstNameField.text;
    NSString *lastName = self.lastNameField.text;
    if (!self.person) {
        self.person = [Person personWithFirstName:firstName andLastName:lastName];
    } else {
        [self.person updateWithFirstName:firstName andLastName:lastName];
    }
    
    [self.person updateAddressWithCountry:self.countryField.text
                                     city:self.cityField.text
                                   street:self.streetField.text
                                     code:self.codeField.text];
    
    
    if (self.saveHandler) {
        self.saveHandler(self.person);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
