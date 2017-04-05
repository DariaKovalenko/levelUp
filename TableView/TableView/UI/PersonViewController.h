//
//  PersonViewController.h
//  TableView
//
//  Created by Daria on 4/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LUPerson;

typedef void (^LUPersonBlock)(LUPerson *person);

@interface PersonViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, copy) LUPersonBlock personHandler;

- (IBAction)textChanged:(UITextField *)sender;
- (IBAction)savePerson:(id)sender;
- (IBAction)takeImageClicked:(id)sender;


@end
