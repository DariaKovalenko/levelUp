//
//  BIDViewController.m
//  Core Data Peristence
//

#import "BIDViewController.h"
#import "BIDPersonViewController.h"
#import "StoreController.h"
#import "Person+CoreDataProperties.h"

@interface BIDViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *persons;

@end

@implementation BIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addPerson)];
    self.navigationItem.rightBarButtonItem = item;
    
    [self reloadAllData];
}

- (void)addPerson {
    [self showPersonViewControllerWithPerson:nil];
}

- (void)reloadAllData {
    self.persons = [Person persons];
    [self.personsTableView reloadData];
}

- (void)showPersonViewControllerWithPerson:(id)person {
    BIDPersonViewController *personViewController = [BIDPersonViewController new];
    personViewController.person = person;
    personViewController.saveHandler = ^(id person) {
        [self reloadAllData];
    };
    
    [self.navigationController pushViewController:personViewController animated:YES];
}

- (void)removePersonAtIndexPath:(NSIndexPath *)indexPath {
    Person *person = self.persons[indexPath.row];
    [person remove];
    [self reloadAllData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    Person *object = self.persons[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", object.firstname, object.lastname];
    
    return cell;
}

#pragma mark - UITableViewDelegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = self.persons[indexPath.row];
    [self showPersonViewControllerWithPerson:object];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self removePersonAtIndexPath:indexPath];
    }];
    
    return @[action];
}

@end
