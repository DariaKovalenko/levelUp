//
//  ViewController.m
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "LUPerson.h"
#import "LUTableViewCell.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *persons;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.persons = @[[LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"]];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LUTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    LUPerson *person = self.persons[indexPath.row];
    cell.textLabel.text = person.firstName;
    cell.detailTextLabel.text = person.lastName;
    
    return cell;
}

@end
