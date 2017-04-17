//
//  LUPersonCell.m
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPersonCell.h"
#import "LUPerson.h"

@implementation LUPersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (IBAction)buttonClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(didClickButtonOnCell:)]) {
        [self.delegate didClickButtonOnCell:self];
    }
    
    if (self.buttonHandler) {
        self.buttonHandler(self);
    }
}

- (void)fillWithPerson:(LUPerson *)person {
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
}

@end
