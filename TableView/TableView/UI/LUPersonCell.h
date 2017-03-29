//
//  LUPersonCell.h
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LUPerson;

@interface LUPersonCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

- (void)fillWithPerson:(LUPerson *)person;

@end
