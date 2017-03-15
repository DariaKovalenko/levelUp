//
//  UIStoryboard+LUExtention.m
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "UIStoryboard+LUExtention.h"

@implementation UIStoryboard (LUExtention)

+ (UIStoryboard *)another {
    return [UIStoryboard storyboardWithName:@"AnotherStoryboard" bundle:nil];
}

- (id)viewControllerForClass:(Class)viewControllerClass {
    return [self instantiateViewControllerWithIdentifier:NSStringFromClass(viewControllerClass)];
}

@end
