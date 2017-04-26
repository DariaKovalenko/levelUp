//
//  MovableView.h
//  MovingViews
//
//  Created by Daria on 4/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovableView;

@protocol MovableViewDelegate <NSObject>

- (BOOL)movableViewShouldPan:(MovableView *)movableView withTransform:(CGAffineTransform)transform;

- (void)movableViewIsRemoved:(MovableView *)movableView;
- (void)movableViewDidLongPress:(MovableView *)movableView;

@end

@interface MovableView : UIView
@property (nonatomic, weak) id <MovableViewDelegate> delegate;

+ (MovableView *)view;

@end
