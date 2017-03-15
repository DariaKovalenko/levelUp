//
//  CustomSegue.m
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform {
    [self.sourceViewController.navigationController pushViewController:self.destinationViewController animated:NO];
}

@end
