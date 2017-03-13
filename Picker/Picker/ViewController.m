//
//  ViewController.m
//  Picker
//
//  Created by Daria on 3/13/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"
#import "CountryPickerView.h"

static const CGFloat LUPickerHeight = 176;
static const CGFloat LUAnimationDuration = 1.25;

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *countries;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerBottomOffset.constant = -LUPickerHeight;
    [self.view layoutIfNeeded];

    self.countries = [NSLocale ISOCountryCodes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)showPickerClicked:(id)sender {
    BOOL isPickerHidden = self.pickerBottomOffset.constant < 0;
    self.pickerBottomOffset.constant = isPickerHidden ? 0.0 : -LUPickerHeight;
    [UIView animateWithDuration:LUAnimationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Picker DataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countries.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:self.countries[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

}

@end
