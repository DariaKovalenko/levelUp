//
//  ViewController.h
//  Picker
//
//  Created by Daria on 3/13/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryPickerView;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *pickerBottomOffset;

@property (strong, nonatomic) IBOutlet CountryPickerView *countryPicker;
- (IBAction)showPickerClicked:(id)sender;

@end

