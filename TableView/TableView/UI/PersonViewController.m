//
//  PersonViewController.m
//  TableView
//
//  Created by Daria on 4/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "PersonViewController.h"
#import "UserImageCell.h"
#import "TextViewCell.h"
#import "TextFieldCell.h"
#import "LUPerson.h"

typedef enum {
    LUPersonImage = 0,
    LUPersonAbout,
    LUPersonFirstName,
    LUPersonLastName,
    LUPersonBirthday,
    LUPersonCounty,
    LUPersonButton,
    LUPersonPropertyCount
} LUPersonProperty;

@interface PersonViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) LUPerson *person;
@property (nonatomic, strong) IBOutlet UITextView *textView;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [LUPerson new];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Actions

- (IBAction)textChanged:(UITextField *)sender {
    NSString *text = [sender text];
    switch ([sender tag]) {
        case LUPersonFirstName:
            self.person.firstName = text;
            break;
        case LUPersonLastName:
            self.person.lastName = text;
            break;
        default:
            break;
    }
}

- (IBAction)savePerson:(id)sender {
    if(self.personHandler) {
        self.personHandler(self.person);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - TableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LUPersonPropertyCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case LUPersonImage: {
            UserImageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserImageCell class])];
            cell.imageView.image = self.person.icon;
            return cell;
        }
        case LUPersonAbout: {
            TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TextViewCell class])];
            cell.updateHandler = ^{
                [tableView beginUpdates];
                [tableView endUpdates];
            };
            return cell;
        }
        case LUPersonButton:
            return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
        default:
        {
            TextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TextFieldCell class])];
            cell.textField.placeholder = [self placeholderRow:indexPath.row];
            cell.textField.tag = indexPath.row;
            [cell.textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
            return cell;
        }
            
            break;
    }
    return nil;
    
}

- (NSString *)placeholderRow:(NSInteger)row {
    switch (row) {
        case LUPersonFirstName:
            return @"First name";
        case LUPersonLastName:
            return @"Last name";
        case LUPersonBirthday:
            return @"Birthday";
        case LUPersonCounty:
            return @"Country";
        default:
            return @"";
    }
}

#pragma mark - UITableViewDelegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

@end
