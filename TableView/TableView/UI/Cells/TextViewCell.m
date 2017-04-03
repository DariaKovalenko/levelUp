//
//  TextViewCell.m
//  TableView
//
//  Created by Daria on 4/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "TextViewCell.h"

@interface TextViewCell () <UITextViewDelegate>

@end

@implementation TextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupHeight];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupHeight {
    UITextView *textView = self.textView;
    [textView sizeToFit];
    self.textViewHeight.constant = textView.frame.size.height;
    [self layoutIfNeeded];
    NSLog(@"%@", textView.text);
    
    if (self.updateHandler) {
        self.updateHandler();
    }
}
#pragma mark - TextView

- (void)textViewDidChange:(UITextView *)textView {
    [self setupHeight];
}

@end
