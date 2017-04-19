//
//  LUPersonCell.m
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUPersonCell.h"
#import "LUPerson.h"

@interface LUPersonCell ()
@property (nonatomic, strong) LUPerson *person;

@end

@implementation LUPersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [self.person removeObserver:self forKeyPath:@"firstName"];
}

- (void)fillWithPerson:(LUPerson *)person {
    self.person = person;
    [person addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew context:nil];
    
    
    self.nameLabel.text = person.firstName;
    person.updateHandler = ^(LUPerson *updatedPerson) {
        self.nameLabel.text = updatedPerson.firstName;
    };
}

@end
