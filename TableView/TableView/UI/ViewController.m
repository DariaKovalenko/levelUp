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
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = refreshControl;
//    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//    header.backgroundColor = [UIColor redColor];
//    self.tableView.tableHeaderView = header;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)showPersonAlert {
    [self performSegueWithIdentifier:@"AddPerson" sender:nil];
}

- (void)reloadData {
    [self.tableView reloadData];
    [self.tableView.refreshControl endRefreshing];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id destinationController = [segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"CellSelected"]) {
        LUPersonCell *cell = sender;
        PersonViewController *personViewController = destinationController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        personViewController.person = self.persons[indexPath.row];
//        personViewController.personHandler = ^(LUPerson *person) {
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        };
    } else {
        if ([destinationController isKindOfClass:[PersonViewController class]]) {
            [destinationController setPersonHandler:^(LUPerson *person){
                [self insertPerson:person];
            }];
        }
    }
}

#pragma mark - Actions

- (IBAction)goBack:(UIStoryboardSegue *)segue {

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
        cell.imageView.image = person.icon;
        cell.imageView.layer.masksToBounds = YES;
        [cell fillWithPerson:person];
        
        return cell;
    } else {
        return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LUTableViewCell class])];
    }
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.persons.count) {
        [self showPersonAlert];
    }
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self removePersonAtIndexPath:indexPath];
    }];
 
    return @[action];
}

- (void)removePersonAtIndexPath:(NSIndexPath *)indexPath {
    [self.persons removeObjectAtIndex:indexPath.row];
    __weak typeof(self) weakSelf = self;
    [self.tableView perfomUpdates:^{
        [weakSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row < self.persons.count;
}

@end
