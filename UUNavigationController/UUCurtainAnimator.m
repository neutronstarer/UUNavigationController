//
//  UUCurtainAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2022/1/9.
//

#import "UUCurtainAnimator.h"
#import "UUTransparentBackgroundView.h"

@interface UUCurtainAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUCurtainAnimator
+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUCurtainAnimator *v = [[self alloc] init];
    v.operation = operation;
    return v;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
#if TARGET_OS_IOS
    return  UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)? UINavigationControllerHideShowBarDuration: 0.25;
#else
    return UINavigationControllerHideShowBarDuration;
#endif
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *fromView           = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView             = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView      = [transitionContext containerView];
    if (self.operation == UINavigationControllerOperationPop){
        if (!transitionContext.isAnimated){
            toView.layer.transform = CATransform3DIdentity;
            [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
            return;
        }
        [containerView exchangeSubviewAtIndex:[[containerView subviews] indexOfObject:fromView] withSubviewAtIndex:[[containerView subviews] indexOfObject:toView]];
        toView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, containerView.bounds.size.height, 0);
        UIView *backgroundView = [fromView uu_addTransparentBackgroundView];
        backgroundView.alpha   = 0;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
            toView.layer.transform = CATransform3DIdentity;
            backgroundView.alpha   = 0.5;
        } completion:^(BOOL finished) {
            [fromView uu_removeTransparentBackgroundView];
            [transitionContext completeTransition:finished &&![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    
    toView.layer.transform   = CATransform3DIdentity;
    toView.frame               = containerView.bounds;
    toView.autoresizingMask    = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    if (!transitionContext.isAnimated){
        toView.layer.transform   = CATransform3DIdentity;
        fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, containerView.bounds.size.height, 0);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    [containerView exchangeSubviewAtIndex:[[containerView subviews] indexOfObject:fromView] withSubviewAtIndex:[[containerView subviews] indexOfObject:toView]];
    fromView.layer.masksToBounds = NO;
    fromView.layer.shadowPath    = [UIBezierPath bezierPathWithRect:toView.bounds].CGPath;
    fromView.layer.shadowColor   = [UIColor blackColor].CGColor;
    fromView.layer.shadowRadius  = 3;
    fromView.layer.shadowOffset  = CGSizeMake(0, -3);
    fromView.layer.shadowOpacity = 0.25;
    UIView *backgroundView     = [fromView uu_addTransparentBackgroundView];
    backgroundView.alpha       = 0.5;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
        fromView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, containerView.bounds.size.height, 0);
        backgroundView.alpha     = 0;
    } completion:^(BOOL finished) {
        [fromView uu_removeTransparentBackgroundView];
        [transitionContext completeTransition:finished &&![transitionContext transitionWasCancelled]];
    }];
}

@end
