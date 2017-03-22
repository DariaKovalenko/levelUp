//
//  LUNibBasedView.m
//  Picker
//
//  Created by Daria on 3/22/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "LUNibBasedView.h"

@implementation LUNibBasedView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self xibSetup];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self xibSetup];
    
    return self;
}

#pragma mark - Public

- (void)initializeProperties {
    
}

- (UIView *)loadViewFromNib {
    NSBundle *bandle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:bandle];
    UIView *view = [[nib instantiateWithOwner:self options:nil] firstObject];
    return view;
}

- (void)prepareForInterfaceBuilder {
    [self xibSetup];
}

#pragma mark - Private

- (void)xibSetup {
    UIView *view = [self loadViewFromNib];
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
    
    [self initializeProperties];
}


@end
