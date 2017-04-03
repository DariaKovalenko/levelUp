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
#import "PersonViewController.h"

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
    self.persons = [@[] mutableCopy];
}

- (void)showPersonAlert {
    [self performSegueWithIdentifier:@"AddPerson" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id destinationController = [segue destinationViewController];
    if ([destinationController isKindOfClass:[PersonViewController class]]) {
        [destinationController setPersonHandler:^(LUPerson *person){
            [self insertPerson:person];
        }];
    }
}

#pragma mark - UITextFieldDelegate


- (void)textChanged:(UITextField *)textField {
    self.personName = textField.text;
}

- (void)createPerson {
    if (!self.personName.length) return;
    
    LUPerson *person = [LUPerson personWithFirstName:self.personName lastName:nil];
    [self insertPerson:person];
}

- (void)insertPerson:(LUPerson *)person {
    [self.persons addObject:person];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.persons.count - 1 inSection:0];
    __weak typeof(self) weakSelf = self;
    [self.tableView perfomUpdates:^{
        [weakSelf.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];

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
