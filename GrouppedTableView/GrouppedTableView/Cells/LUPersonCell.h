//
//  LUPersonCell.h
//  TableView
//
//  Created by Daria on 3/29/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LUPersonCell;

typedef void (^CellBlock)(LUPersonCell *);

@protocol LUPersonCellDelegate <NSObject>

- (void)didClickButtonOnCell:(LUPersonCell *)cell;

@end

@class LUPerson;

@interface LUPersonCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak) id <LUPersonCellDelegate> delegate;

@property (nonatomic, copy) CellBlock buttonHandler;

- (void)fillWithPerson:(LUPerson *)person;

@end
