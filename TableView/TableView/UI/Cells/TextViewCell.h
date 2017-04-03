//
//  TextViewCell.h
//  TableView
//
//  Created by Daria on 4/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LUVoidBlock)(void);

@interface TextViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;

@property (nonatomic, copy) LUVoidBlock updateHandler;

@end
