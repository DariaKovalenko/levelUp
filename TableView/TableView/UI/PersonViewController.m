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

@interface PersonViewController () <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
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

- (IBAction)takeImageClicked:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *selectionController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [selectionController addAction:[UIAlertAction actionWithTitle:@"Take photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPickerForSource:UIImagePickerControllerSourceTypeCamera];
        }]];
        [selectionController addAction:[UIAlertAction actionWithTitle:@"Select from album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPickerForSource:UIImagePickerControllerSourceTypePhotoLibrary];
        }]];
        [selectionController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
        [self presentViewController:selectionController animated:YES completion:nil];
    } else {
        [self showPickerForSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}
    
- (void)showPickerForSource:(UIImagePickerControllerSourceType)source {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = source;
    imagePicker.editing = YES;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.person.icon = image;
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:picker completion:nil];
}

#pragma mark - TableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LUPersonPropertyCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case LUPersonImage: {
            UserImageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserImageCell class])];
            cell.userImageView.image = self.person.icon;
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
