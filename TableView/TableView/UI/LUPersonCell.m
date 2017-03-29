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


- (void)fillWithPerson:(LUPerson *)person {
    self.nameLabel.text = person.firstName;
}

@end
