//
//  CountryPickerView.m
//  Picker
//
//  Created by Daria on 3/13/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "CountryPickerView.h"

@interface CountryPickerView ()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation CountryPickerView


#pragma mark - Public

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundView.backgroundColor = self.pickerColor;
}

@end
