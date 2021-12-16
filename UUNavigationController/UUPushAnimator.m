//
//  UUPushAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/8.
//

#import "UUPushAnimator.h"
#import "UUTransparentBackgroundView.h"

@interface UUPushAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUPushAnimator

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUPushAnimator *v = [[self alloc] init];
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
            toView.layer.transform   = CATransform3DIdentity;
            fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, fromView.bounds.size.width, 0, 0);
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            return;
        }
        toView.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.985, 0.985, 0.985);
        UIView *backgroundView = [fromView uu_addTransparentBackgroundView];
        backgroundView.alpha   = 0.5;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
            toView.layer.transform   = CATransform3DIdentity;
            fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, fromView.bounds.size.width, 0, 0);
            backgroundView.alpha     = 0;
        } completion:^(BOOL finished) {
            [fromView uu_removeTransparentBackgroundView];
            [transitionContext completeTransition:finished&&![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    toView.layer.transform     = CATransform3DIdentity;
    toView.frame               = containerView.bounds;
    toView.autoresizingMask    = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    toView.layer.masksToBounds = NO;
    toView.layer.transform     = CATransform3DTranslate(CATransform3DIdentity, fromView.bounds.size.width, 0, 0);
    toView.layer.shadowPath    = [UIBezierPath bezierPathWithRect:toView.bounds].CGPath;
    toView.layer.shadowColor   = [UIColor blackColor].CGColor;
    toView.layer.shadowRadius  = 3;
    toView.layer.shadowOffset  = CGSizeMake(-3, 0);
    toView.layer.shadowOpacity = 0.25;
    if (!transitionContext.isAnimated){
        toView.layer.transform   = CATransform3DIdentity;
        fromView.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.985, 0.985, 0.985);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    UIView *backgroundView = [toView uu_addTransparentBackgroundView];
    backgroundView.alpha   = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
        toView.layer.transform   = CATransform3DIdentity;
        fromView.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.985, 0.985, 0.985);
        backgroundView.alpha     = 0.5;
    } completion:^(BOOL finished) {
        [toView uu_removeTransparentBackgroundView];
        [transitionContext completeTransition:finished&&![transitionContext transitionWasCancelled]];
    }];
}


@end
