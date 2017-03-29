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

+ (UIStoryboard *)main {
    return  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

+ (UIStoryboard *)mainFlow {
    return  [UIStoryboard storyboardWithName:@"MainFlow" bundle:nil];
}

+ (UIStoryboard *)profile {
    return  [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
}

- (id)viewControllerForClass:(Class)viewControllerClass {
    return [self instantiateViewControllerWithIdentifier:NSStringFromClass(viewControllerClass)];
}

@end
