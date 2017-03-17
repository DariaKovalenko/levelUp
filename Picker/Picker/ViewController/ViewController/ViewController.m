//
//  ViewController.m
//  Picker
//
//  Created by Daria on 3/13/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "ViewController.h"

#import "CountryPickerView.h"
#import "LUAnotherViewController.h"
#import "LUThirdViewController.h"

#import "UIStoryboard+LUExtention.h"
#import "UIViewController+LUExtentions.h"

static const CGFloat LUPickerHeight = 176;
static const CGFloat LUAnimationDuration = 1.25;

static NSString *LUShowSuperTitleController = @"ShowSuperTitle";

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray *countries;
@property (nonatomic, strong) CountryPickerView *picker;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _picker = nil;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _picker = nil;
    }
    
    return self;
    
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueIdentifier = segue.identifier;
    // add some data to controller
    if ([segueIdentifier isEqualToString:LUShowSuperTitleController]) {
        UIViewController *destination = segue.destinationViewController;
        destination.title = @"MY SUPERTITLE";
    } else {
        UIViewController *destination = segue.destinationViewController;
        destination.title = @"Some other titile";
    }
}

#pragma mark - Actions

- (IBAction)showPickerClicked:(id)sender {
    BOOL isPickerHidden = self.pickerBottomOffset.constant < 0;
    self.pickerBottomOffset.constant = isPickerHidden ? 0.0 : -LUPickerHeight;
    [UIView animateWithDuration:LUAnimationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)showPickerProgrammatically {
    if (!self.picker) {
        [self showpicker];
    } else {
        CGRect finalFrame = self.picker.frame;
        finalFrame.origin = CGPointMake(0, self.view.frame.size.height);
        [UIView animateWithDuration:0.3 animations:^{
            self.picker.frame = finalFrame;
        } completion:^(BOOL finished) {
            [self.picker removeFromSuperview];
            self.picker = nil;
        }];
    }
}

- (IBAction)showSupertitleClicked:(id)sender {
    [self performSegueWithIdentifier:LUShowSuperTitleController sender:nil];
}

- (void)showFromXIB {
    LUAnotherViewController *anotherController = [LUAnotherViewController new];
    anotherController.title = @"My Some Perfect title";
    [self.navigationController pushViewController:anotherController animated:YES];
}

- (void)showNotInitialFromStoryboard {
    //    LUThirdViewController *anotherController = [[UIStoryboard another] viewControllerForClass:[LUThirdViewController class]];
    LUThirdViewController *anotherController = [LUThirdViewController viewControllerWithStoryboard:[UIStoryboard another]];
    
    [self.navigationController pushViewController:anotherController animated:YES];
}

- (void)showFromInitialAnotherStoryboard {
    UIViewController *anotherController = [[UIStoryboard storyboardWithName:@"AnotherStoryboard" bundle:nil] instantiateInitialViewController];
    anotherController.title = @"some title"; // or put some data
    [self.navigationController pushViewController:anotherController animated:YES];
}

- (void)showpicker {
    CGRect screenFrame = self.view.frame;
    CGRect pickerFrame = CGRectMake(0, screenFrame.size.height, screenFrame.size.width, LUPickerHeight);
    
    CountryPickerView *picker = [[CountryPickerView alloc] initWithFrame:pickerFrame];
    picker.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:picker];
    
    self.picker = picker;
    
    pickerFrame.origin = CGPointMake(0, screenFrame.size.height - LUPickerHeight);
    [UIView animateWithDuration:0.3 animations:^{
        picker.frame = pickerFrame;
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
