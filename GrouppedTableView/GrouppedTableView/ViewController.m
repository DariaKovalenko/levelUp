//
//  ViewController.m
//  GrouppedTableView
//
//  Created by Daria on 4/17/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "LUPerson.h"
#import "HeaderCell.h"
#import "FooterCell.h"
#import "LUPersonCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, LUPersonCellDelegate>
@property (nonatomic, strong) NSArray *groupOfPersons;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *cellIdentifier = NSStringFromClass([LUPersonCell class]);
    [self.personsTableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
    
    self.groupOfPersons =  @[
                      @[[LUPerson personWithFirstName:@"Ivan" lastName:@"Apple"],
                        [LUPerson personWithFirstName:@"Peter" lastName:@"Announce"],
                        [LUPerson personWithFirstName:@"Sidor" lastName:@"Alala"]],
                      
                      @[[LUPerson personWithFirstName:@"Vasia" lastName:@"Canljljl"],
                        [LUPerson personWithFirstName:@"Ivan" lastName:@"Ckljkljl"],
                        [LUPerson personWithFirstName:@"Peter" lastName:@"Cljkjklj"],
                        [LUPerson personWithFirstName:@"Sidor" lastName:@"Cljkjklj"],
                        [LUPerson personWithFirstName:@"Vasia" lastName:@"Ckjlkjlk"]],
                      
                      @[[LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                        [LUPerson personWithFirstName:@"Peter" lastName:@"Ivvkjlv"],
                        [LUPerson personWithFirstName:@"Sidor" lastName:@"Ivkbjklgjlk"],
                        [LUPerson personWithFirstName:@"Vasia" lastName:@"Ibkljlskfj"]],
                      
                      @[[LUPerson personWithFirstName:@"Ivan" lastName:@"Ivanov"],
                      [LUPerson personWithFirstName:@"Peter" lastName:@"Pertov"],
                      [LUPerson personWithFirstName:@"Sidor" lastName:@"Sidorov"],
                      [LUPerson personWithFirstName:@"Vasia" lastName:@"Pupkin"]]
    ];
}

- (void)didClickButtonOnCell:(LUPersonCell *)cell {
    NSIndexPath *path = [self.personsTableView indexPathForCell:cell];
}

#pragma mark - UITableViewDataSource Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupOfPersons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.groupOfPersons[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Group %ld", (long)section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HeaderCell class])];
    headerCell.label.text = [self tableView:tableView titleForHeaderInSection:section];
    
    return headerCell.contentView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section < self.groupOfPersons.count - 1) {
        FooterCell *footerCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FooterCell class])];
        footerCell.label.text = [self tableView:tableView titleForHeaderInSection:section];
        
        return footerCell.contentView;
    } else {
        return nil;
    }
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"A", @"C", @"I", @"P"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = NSStringFromClass([LUPersonCell class]);
    LUPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSArray *persons = self.groupOfPersons[indexPath.section];
    LUPerson *person = persons[indexPath.row];
    [cell fillWithPerson:person];
    cell.delegate = self;
    
    cell.buttonHandler = ^(LUPersonCell *cell) {
    
    };
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section < self.groupOfPersons.count - 1 ?  46 : 0.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 40 : 28;
}

@end
