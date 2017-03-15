//
//  UIViewController+LUExtentions.m
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "UIViewController+LUExtentions.h"

@implementation UIViewController (LUExtentions)

+ (instancetype)viewControllerWithStoryboard:(UIStoryboard *)storyboard {
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

@end
