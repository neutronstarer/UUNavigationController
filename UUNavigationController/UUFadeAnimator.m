//
//  UUFadeAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/25.
//

#import "UUFadeAnimator.h"

@interface UUFadeAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUFadeAnimator

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUFadeAnimator *v = [[self alloc] init];
    v.operation = operation;
    return v;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return UINavigationControllerHideShowBarDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView           = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView             = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView      = [transitionContext containerView];
    if (self.operation == UINavigationControllerOperationPop){
        if (!transitionContext.isAnimated){
            fromView.alpha = 0;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            return;
        }
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished&&![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    toView.layer.transform     = CATransform3DIdentity;
    toView.frame               = containerView.bounds;
    toView.autoresizingMask    = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    if (!transitionContext.isAnimated){
        toView.alpha   = 1;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    toView.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished&&![transitionContext transitionWasCancelled]];
    }];
}

@end
