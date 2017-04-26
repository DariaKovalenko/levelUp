//
//  MovableView.m
//  MovingViews
//
//  Created by Daria on 4/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

#import "MovableView.h"

@interface MovableView () <UIGestureRecognizerDelegate>
@property (nonatomic, assign) CGAffineTransform beginTransform;
@property (nonatomic) NSMutableSet *activeRecognizers;
@end


@implementation MovableView

+ (MovableView *)view {
    MovableView *view = [[MovableView alloc] initWithFrame:CGRectMake(0, 0, 80, 120)];
    view.backgroundColor = [UIColor blueColor];
    
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self addGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self addGestureRecognizers];
    
    return self;
}

- (void)addGestureRecognizers {
    self.activeRecognizers = [NSMutableSet set];
    
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongTap:)]];
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)]];
    
    
    UIGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(didChange:)];
    rotation.delegate = self;
    UIGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didChange:)];
    pinch.delegate = self;
    [self addGestureRecognizer:rotation];
    [self addGestureRecognizer:pinch];
}

- (void)didLongTap:(UILongPressGestureRecognizer *)gestureRecognizer {
//    id <MovableViewDelegate> delegate = self.delegate;
//    if ([delegate respondsToSelector:@selector(movableViewDidLongPress:)]) {
//        [delegate movableViewDidLongPress:self];
//    }
    
    [self removeFromSuperview];
    id <MovableViewDelegate> delegate = self.delegate;
    if ([delegate respondsToSelector:@selector(movableViewIsRemoved:)]) {
        [delegate movableViewIsRemoved:self];
    }
}

- (void)didChange:(UIPinchGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.beginTransform = self.transform;
            [self.activeRecognizers addObject:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self transformateView];
            break;
        case UIGestureRecognizerStateEnded:
            [self.activeRecognizers removeObject:gestureRecognizer];
        default:
            break;
    }
}

- (void)transformateView {
    CGAffineTransform transform = self.beginTransform;
    for (id gestureRecognizer in self.activeRecognizers) {
        if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
            CGFloat scale = [(UIPinchGestureRecognizer *)gestureRecognizer scale];
            transform = CGAffineTransformScale(transform, scale, scale);
        } else if ([gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
            transform = CGAffineTransformRotate(transform, [gestureRecognizer rotation]);
        }
        
    }
    self.transform = transform;
    
}

- (void)didPan:(UIPanGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.beginTransform = self.transform;
            break;
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gestureRecognizer translationInView:self];
            [self transformWithTranslation:translation];
        }
            break;
        default:
            break;
    }
}

- (void)transformWithTranslation:(CGPoint)translation {
//    id <MovableViewDelegate> delegate = self.delegate;
    CGAffineTransform transform = CGAffineTransformTranslate(self.beginTransform, translation.x, translation.y);
//    BOOL canPan = !delegate || ([delegate respondsToSelector:@selector(movableViewShouldPan:withTransform:)] && [delegate movableViewShouldPan:self withTransform:transform]);
    
//    if (canPan) {
        self.transform = transform;
//    }
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return ([otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] && [gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) ||
//    ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]);
//}

@end
