//
//  UUHeroAnimator.m
//  UUNavigationController
//
//  Created by neutronstarer on 2022/1/9.
//

#import <objc/runtime.h>
#import "UUHeroAnimator.h"
#import "UIView+UUPrivate.h"
@interface UUHeroAnimatorContext: NSObject

@property (nonatomic, weak) UIView *superview;
@property (nonatomic, weak) UIView *view;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGRect frame0;
@property (nonatomic, assign) CGRect frame1;

@end

@implementation UUHeroAnimatorContext

@end

@interface UUHeroAnimator()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation UUHeroAnimator

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation{
    UUHeroAnimator *v = [[self alloc] init];
    v.operation = operation;
    return v;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    UIView *fromView           = [transitionContext viewForKey:UITransitionContextFromViewKey];
//    UIView *toView             = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView      = [transitionContext containerView];
    if (![transitionContext isAnimated]){
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    UIView * fromView = [[[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] topViewController] view];
    UIView * toView = [[[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] topViewController] view];
    [containerView layoutIfNeeded];
    NSMutableArray<UUHeroAnimatorContext*> *ctxes = [NSMutableArray array];
    NSArray<UIView*> *views = [toView findAllHeroSubviews];
    for (UIView *tView in views) {
        UIView *fView = [fromView findSpecialHeroSubviewById:tView.uu_heroId];
        if (fView){
            UUHeroAnimatorContext *c = [UUHeroAnimatorContext new];
            c.view = tView;
            c.superview = tView.superview;
            c.frame = tView.frame;
            c.frame0 = [tView.superview convertRect:tView.frame toView:containerView];
            c.frame1 = [fView.superview convertRect:fView.frame toView:containerView];
            [ctxes addObject:c];
            [containerView addSubview:tView];
            tView.frame = c.frame1;
        }
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:^{
        for (UUHeroAnimatorContext *ctx in ctxes) {
            ctx.view.frame = ctx.frame0;
        }
    } completion:^(BOOL finished) {
        BOOL completed = finished && ![transitionContext transitionWasCancelled];
        for (UUHeroAnimatorContext *ctx in ctxes) {
            [ctx.superview addSubview:ctx.view];
            ctx.view.frame = ctx.frame;
        }
        [transitionContext completeTransition:completed];
    }];
}

@end
