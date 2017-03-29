//
//  UIStoryboard+LUExtention.h
//  Picker
//
//  Created by Daria on 3/15/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (LUExtention)

+ (UIStoryboard *)another;
+ (UIStoryboard *)main;
+ (UIStoryboard *)mainFlow;
+ (UIStoryboard *)profile;

- (id)viewControllerForClass:(Class)viewControllerClass;

@end
