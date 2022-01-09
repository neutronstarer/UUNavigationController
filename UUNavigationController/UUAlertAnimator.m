//
//  UUAlertAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/5.
//

#import "UUAlertAnimator.h"
#import "UUTransparentBackgroundView.h"

@interface UUAlertAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUAlertAnimator

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUAlertAnimator *v = [[self alloc] init];
    v.operation = operation;
    return v;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return UINavigationControllerHideShowBarDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView       = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView         = [transitionContext viewForKey:UITransitionContextToViewKey];
    if (self.operation == UINavigationControllerOperationPop){
        if (!transitionContext.isAnimated){
            toView.layer.transform = CATransform3DIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            return;
        }
        toView.layer.transform = CATransform3DIdentity;
        UIView *backgroundView = [fromView uu_addTransparentBackgroundView];
        backgroundView.alpha = 0.5;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
            fromView.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.75, 0.75, 0.75);
            fromView.alpha           = 0;
            backgroundView.alpha     = 0;
        } completion:^(BOOL finished) {
            BOOL completed = finished && ![transitionContext transitionWasCancelled];
            if (completed){
                [fromView uu_removeTransparentBackgroundView];
            }
            [transitionContext completeTransition:completed];
        }];
        return;
    }
    UIView *containerView      = [transitionContext containerView];
    toView.layer.transform     = CATransform3DIdentity;
    CGSize size                = [[[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] topViewController].view systemLayoutSizeFittingSize:containerView.bounds.size];
    size                       = CGSizeMake(fmin(size.width, containerView.bounds.size.width), fmin(size.height, containerView.bounds.size.height));
    toView.frame               = CGRectMake((containerView.bounds.size.width-size.width)/2.0, (containerView.bounds.size.height-size.height)/2.0, size.width, size.height);
    toView.autoresizingMask    = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin;
    toView.layer.masksToBounds = NO;
    toView.layer.shadowPath    = [UIBezierPath bezierPathWithRect:toView.bounds].CGPath;
    toView.layer.shadowColor   = [UIColor blackColor].CGColor;
    toView.layer.shadowRadius  = 3;
    toView.layer.shadowOffset  = CGSizeMake(0, 0);
    toView.layer.shadowOpacity = 0.25;
    UIView *backgroundView     = [toView uu_addTransparentBackgroundView];
    if (!transitionContext.isAnimated){
        toView.layer.transform = CATransform3DIdentity;
        toView.alpha           = 1;
        backgroundView.alpha   = 0.5;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    toView.alpha            = 0;
    toView.layer.transform  = CATransform3DScale(CATransform3DIdentity, 0.75, 0.75, 0.75);
    backgroundView.alpha    = 0;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.25 initialSpringVelocity:16 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.layer.transform = CATransform3DIdentity;
    } completion:nil];
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
        toView.alpha         = 1;
        backgroundView.alpha = 0.5;
    } completion:^(BOOL finished) {
        BOOL completed = finished&&![transitionContext transitionWasCancelled];
        if (!completed){
            [toView uu_removeTransparentBackgroundView];
        }
        [transitionContext completeTransition:completed];
    }];
}

- (BOOL)transparent{
    return YES;
}

@end
