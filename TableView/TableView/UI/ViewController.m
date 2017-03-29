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
#import "LUPersonCell.h"
#import "UITableView+LUExtentions.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *persons;
@property (nonatomic, strong) NSString *personName;
@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.persons = [@[
//                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
//                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
//                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
//                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
//                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
//                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
//                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
//                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
//                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
//                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
//                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
//                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"],
//                     [LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
//                     [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
//                     [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
//                     [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"]
                      ] mutableCopy];
}

- (void)showPersonAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Create Person" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self createPerson];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate


- (void)textChanged:(UITextField *)textField {
    self.personName = textField.text;
}

- (void)createPerson {
    if (!self.personName.length) return;
    
    LUPerson *person = [LUPerson personWithFirstName:self.personName lastName:nil];
    [self.persons addObject:person];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.persons.count - 1 inSection:0];
    __weak typeof(self) weakSelf = self;
    [self.tableView perfomUpdates:^{
        [weakSelf.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
//    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.persons.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.persons.count) {
        NSString *identifier = NSStringFromClass([LUPersonCell class]);
        LUPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        LUPerson *person = self.persons[indexPath.row];
        [cell fillWithPerson:person];
        
        return cell;
    } else {
        return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LUTableViewCell class])];
    }
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.persons.count) {
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self showPersonAlert];
    }
}

@end
