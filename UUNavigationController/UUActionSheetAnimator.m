//
//  UUActionSheetAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/9.
//

#import "UUActionSheetAnimator.h"
#import "UUTransparentBackgroundView.h"

@interface UUActionSheetAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUActionSheetAnimator

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUActionSheetAnimator *v = [[self alloc] init];
    v.operation = operation;
    return v;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return UINavigationControllerHideShowBarDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView          = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView            = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView     = transitionContext.containerView;
    if (self.operation == UINavigationControllerOperationPop){
        if (!transitionContext.isAnimated){
            toView.layer.transform   = CATransform3DIdentity;
            fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, fromView.bounds.size.height, 0);
            [fromView uu_removeTransparentBackgroundView];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            return;
        }
        UIView *backgroundView       = [fromView uu_addTransparentBackgroundView];
        backgroundView.alpha         = 0.5;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
            toView.layer.transform   = CATransform3DIdentity;
            fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, fromView.bounds.size.height, 0);
            backgroundView.alpha     = 0;
        } completion:^(BOOL finished) {
            BOOL completed = !transitionContext.transitionWasCancelled && finished;
            if (completed){
                [fromView uu_removeTransparentBackgroundView];
            }
            [transitionContext completeTransition:completed];
        }];
        return;
    }
    toView.layer.transform     = CATransform3DIdentity;
    CGSize size                = [[[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] topViewController].view systemLayoutSizeFittingSize:containerView.bounds.size];
    size                       = CGSizeMake(fmin(size.width, containerView.bounds.size.width), fmin(size.height, containerView.bounds.size.height));
#if TARGET_OS_IOS
    if (@available(iOS 11.0, *)) {
        size.height               += toView.safeAreaInsets.bottom;
    }
#endif
#if TARGET_OS_TV
    if (@available(tvOS 11.0, *)) {
        size.height               += toView.safeAreaInsets.bottom;
    }
#endif
    toView.frame               = CGRectMake((containerView.bounds.size.width-size.width)/2.0, containerView.bounds.size.height-size.height, size.width, size.height);
    toView.autoresizingMask    = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    toView.layer.masksToBounds = NO;
    toView.layer.shadowPath    = [UIBezierPath bezierPathWithRoundedRect:toView.bounds cornerRadius:8].CGPath;
    toView.layer.shadowColor   = [UIColor blackColor].CGColor;
    toView.layer.shadowRadius  = 3;
    toView.layer.shadowOffset  = CGSizeMake(0, 0);
    toView.layer.shadowOpacity = 0.25;
    UUTransparentBackgroundView *backgroundView = [toView uu_addTransparentBackgroundView];
    __weak UINavigationController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    backgroundView.tapHandle = ^{
        [toViewController popViewControllerAnimated:YES];
    };
    if (!transitionContext.isAnimated){
        backgroundView.alpha   = 0.5;
        toView.layer.transform = CATransform3DIdentity;
        return;
    }
    toView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, toView.bounds.size.height, 0);
    backgroundView.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.layer.transform = CATransform3DIdentity;
        backgroundView.alpha   = 0.5;
    } completion:^(BOOL finished) {
        BOOL completed = !transitionContext.transitionWasCancelled && finished;
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
