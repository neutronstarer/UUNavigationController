//
//  UUNavigationController.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/message.h>
#import <pthread.h>

#import "NSArray+UUPrivate.h"
#import "NSMutableArray+UUPrivate.h"
#import "NSObject+UUPrivate.h"
#import "UINavigationController+UUPrivate.h"
#import "UIViewController+UUPrivate.h"
#import "UUNavigationController.h"
#import "UUPushAnimator.h"
#import "UU__UIViewControllerOneToOneTransitionContext.h"

static inline void Main(void(^block)(void)){
    if (pthread_main_np()){
        block();
        return;
    }
    dispatch_sync(dispatch_get_main_queue(), ^{
        block();
    });
}

@interface UUNavigationController ()
{
    CGPoint _interactorStartPoint;
}
@property (nonatomic, strong) NSArray <UINavigationController*>    *navigationControllers;

@property (nonatomic, copy  ) NSString                             *nibNameOrNil;
@property (nonatomic, strong) NSBundle                             *nibBundleOrNil;
@property (nonatomic, assign) Class                                navigationControllerClass;
@property (nonatomic, assign) Class                                navigationBarClass;
@property (nonatomic, assign) Class                                toolBarClass;
@property (nonatomic, strong) NSCoder                              *coder;
@property (nonatomic, strong) dispatch_queue_t                     queue;
@property (nonatomic, strong) dispatch_semaphore_t                 sempaphore;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactor;
#if TARGET_OS_IOS
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer     *_interactivePopGestureRecognizer;
#endif
@property (nonatomic, strong) NSArray                              *viewWillAppearAppearances;
@property (nonatomic, strong) NSArray                              *viewWillDisappearAppearances;

//@property (nonatomic, weak  ) UINavigationController               *statusBarController;
//@property (nonatomic, weak  ) UINavigationController               *rotationController;
//@property (nonatomic, weak  ) UINavigationController               *homeIndicatorController;
//@property (nonatomic, weak  ) UINavigationController               *screenEdgesController;
//@property (nonatomic, weak  ) UINavigationController               *pointerLockedController;
//@property (nonatomic, weak  ) UINavigationController               *userInterfaceStyleController;


@end

@implementation UUNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
#if TARGET_OS_IOS
    [self.view addGestureRecognizer:self.interactivePopGestureRecognizer];
#endif
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nil bundle:nil];
    self.nibNameOrNil = nibNameOrNil;
    self.nibBundleOrNil = nibBundleOrNil;
    [self config];
    return self;
}

- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolBarClass {
    self = [self initWithNibName:nil bundle:nil];
    if (!self){
        return nil;
    }
    self.navigationBarClass = navigationBarClass;
    self.toolBarClass = toolBarClass;
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self=[self initWithNibName:nil bundle:nil];
    if (!self) {
        return nil;
    }
    self.viewControllers = @[rootViewController];
    return self;
}

- (instancetype)initWithNavigationControllerClass:(nullable Class)navigationControllerClass{
    self = [self initWithNibName:nil bundle:nil];
    if (!self) {
        return nil;
    }
    self.navigationControllerClass = navigationControllerClass;
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (!self){
        return nil;
    }
    self = [super initWithCoder:aDecoder];
    UIViewController *rootViewController = self.childViewControllers.firstObject;
    if (rootViewController){
        [rootViewController willMoveToParentViewController:nil];
        [rootViewController removeFromParentViewController];
        self.viewControllers = @[rootViewController];
    }
    [self config];
    return self;
}

- (void)config{
    self.navigationBarHidden = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self pushViewController:viewController animated:animated completion:nil];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(BOOL))completion{
    [self pushViewControllers:viewController?@[viewController]:@[] animated:animated completion:completion];
}

- (void)pushViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated{
    [self pushViewControllers:viewControllers?viewControllers:@[] animated:animated completion:nil];
}

- (void)pushViewControllers:(NSArray<UIViewController *> *)newViewControllers animated:(BOOL)animated completion:(void (^)(BOOL))completion{
    [self setNavigationControllers: ({
        NSArray *oldViewControllers = self.viewControllers;
        NSMutableArray *v = [NSMutableArray arrayWithCapacity:oldViewControllers.count+newViewControllers.count];
        [v addObjectsFromArray:self.navigationControllers];
        [newViewControllers enumerateObjectsUsingBlock:^(UIViewController * obj, NSUInteger idx, BOOL *stop) {
            UINavigationController *navigationController = obj.navigationController;
            if (!navigationController){
                navigationController = ({
                    UINavigationController  *v;
                    if (self.coder){
                        v = [[self.navigationControllerClass alloc] initWithCoder:self.coder];
                    }else if (self.nibBundleOrNil && self.nibNameOrNil){
                        v = [[self.navigationControllerClass alloc] initWithNavigationBarClass:self.navigationBarClass toolbarClass:self.toolBarClass];
                    }else{
                        v = [[self.navigationControllerClass alloc] initWithNibName:self.nibNameOrNil bundle:self.nibBundleOrNil];
                    }
                    v.uu_navigationController = self;
                    v.uu_viewController = obj;
                    v;
                });
            }
            [v addObject:navigationController];
        }];
        v;
    }) animated:animated completion:completion];
}

- (UIViewController*)popViewControllerAnimated:(BOOL)animated{
    return [self popViewControllerAnimated:animated completion:nil];
}

- (UIViewController*)popViewControllerAnimated:(BOOL)animated completion:(void (^)(BOOL))completion{
    NSArray *oldViewControllers = self.viewControllers;
    if (oldViewControllers.count <= 1){
        if (completion){
            completion(YES);
        }
        return nil;
    }
    return [self popToViewController:oldViewControllers[oldViewControllers.count-2] animated:animated completion:completion].firstObject;
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    return [self popToRootViewControllerAnimated:animated completion:nil];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(BOOL))completion{
    NSArray *oldViewControllers = self.viewControllers;
    if (oldViewControllers.count <= 1){
        if (completion){
            completion(YES);
        }
        return nil;
    }
    return [self popToViewController:oldViewControllers[0] animated:animated completion:completion];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    return [self popToViewController:viewController animated:animated completion:nil];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(BOOL))completion{
    NSArray *oldViewControllers = self.viewControllers;
    NSInteger index = oldViewControllers?[oldViewControllers indexOfObject:viewController]:NSNotFound;
    NSInteger count = oldViewControllers.count;
    if (index == NSNotFound || index == oldViewControllers.count-1){
        if (completion){
            completion(YES);
        }
        return nil;
    }
    [self setNavigationControllers:[self.navigationControllers subarrayWithRange:NSMakeRange(0, index+1)] animated:animated completion:completion];
    return [oldViewControllers subarrayWithRange:NSMakeRange(index+1, count-index-1)];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers{
    [self setViewControllers:viewControllers animated:NO];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated{
    [self setViewControllers:viewControllers animated:animated completion:nil];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)newViewControllers animated:(BOOL)animated completion:(void (^)(BOOL))completion{
    [self setNavigationControllers:({
        NSMutableArray *v = [NSMutableArray array];
        [newViewControllers enumerateObjectsUsingBlock:^(UIViewController * obj, NSUInteger idx, BOOL *stop) {
            UINavigationController *navigationController = obj.navigationController;
            if (!navigationController){
                navigationController = ({
                    UINavigationController  *v;
                    if (self.coder){
                        v = [[self.navigationControllerClass alloc] initWithCoder:self.coder];
                    }else if (self.nibBundleOrNil && self.nibNameOrNil){
                        v = [[self.navigationControllerClass alloc] initWithNavigationBarClass:self.navigationBarClass toolbarClass:self.toolBarClass];
                    }else{
                        v = [[self.navigationControllerClass alloc] initWithNibName:self.nibNameOrNil bundle:self.nibBundleOrNil];
                    }
                    v.uu_navigationController = self;
                    v.uu_viewController = obj;
                    v;
                });
            }
            [v addObject:navigationController];
        }];
        v;
    }) animated:animated completion:completion];
}

- (void)setNavigationControllers:(NSArray<UINavigationController *> *)newNavigationControllers animated:(BOOL)animated completion:(void (^)(BOOL))completion{
    __weak typeof(self) weakSelf = self;
    NSArray<UINavigationController*> *oldNavigationControllers = ({
        NSArray *v = self.navigationControllers;
        v = [v?v:@[] copy];
        v;
    });
    animated = oldNavigationControllers.count>0?animated:NO;
    newNavigationControllers = [newNavigationControllers uu_unique];
    self.navigationControllers = newNavigationControllers;
    if (!animated){
        dispatch_sync(self.queue, ^{
            __strong typeof (weakSelf) self = weakSelf;
            [self setNewNavigationControllers:newNavigationControllers oldNavigationControllers:oldNavigationControllers animated:animated completion:^(BOOL finished) {
                __strong typeof (weakSelf) self = weakSelf;
                if (!finished){
                    self.navigationControllers = oldNavigationControllers;
                }
                if (completion){
                    completion(finished);
                }
            }];
        });
        return;
    }
    dispatch_async(self.queue, ^{
        __strong typeof (weakSelf) self = weakSelf;
        [self setNewNavigationControllers:newNavigationControllers oldNavigationControllers:oldNavigationControllers animated:animated completion:^(BOOL finished) {
            __strong typeof (weakSelf) self = weakSelf;
            if (!finished){
                self.navigationControllers = oldNavigationControllers;
            }
            if (completion){
                completion(finished);
            }
        }];
    });
}

- (void)setNewNavigationControllers:(NSArray<UINavigationController *> *)newNavigationControllers oldNavigationControllers:(NSArray<UINavigationController *> *)oldNavigationControllers animated:(BOOL)animated completion:(void(^)(BOOL))completion{
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_semaphore_wait(self.sempaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_t group = dispatch_group_create();
    
    UINavigationControllerOperation estimatedOperation = ({
        UINavigationControllerOperation v = UINavigationControllerOperationNone;
        if (![oldNavigationControllers containsObject:newNavigationControllers.lastObject]){
            v = UINavigationControllerOperationPush;
        }else if(![newNavigationControllers containsObject:oldNavigationControllers.lastObject]){
            v = UINavigationControllerOperationPop;
        }
        v;
    });
    
    NSArray<UINavigationController*> *willPopNavigationControllers = [oldNavigationControllers filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", newNavigationControllers]];
    
    NSMutableArray *sortedNavigationController = ({
        NSMutableArray *v = [NSMutableArray arrayWithCapacity:oldNavigationControllers.count+newNavigationControllers.count];
        [v addObjectsFromArray:newNavigationControllers];
        [willPopNavigationControllers enumerateObjectsUsingBlock:^(UINavigationController *obj, NSUInteger idx, BOOL *stop) {
            NSInteger index = [oldNavigationControllers indexOfObject:obj];
            if (index == 0){
                [v insertObject:obj atIndex:0];
                return;
            }
            index = [v indexOfObject:oldNavigationControllers[index-1]];
            [v insertObject:obj atIndex:index+1];
        }];
        v;
    });
    
    NSInteger sortedCount = sortedNavigationController.count;
    
    //    UINavigationController *oldStatusBarController = self.statusBarController, *oldRotationController = self.rotationController, *oldHomeIndicatorController = self.homeIndicatorController, *oldScreenEdgesController = self.screenEdgesController, *oldPointerLockedController = self.pointerLockedController, *newStatusBarController = nil, *newRotationController = nil, *newHomeIndicatorController = nil, *newScreenEdgesController = nil, *newPointerLockedController = nil;
    //
    //    void(^applyControllers)(void) = ^{
    //        __strong typeof(weakSelf) self = weakSelf;
    //        self.statusBarController = newStatusBarController;
    //        self.rotationController = newRotationController;
    //        self.homeIndicatorController = newHomeIndicatorController;
    //        self.screenEdgesController = newScreenEdgesController;
    //        self.pointerLockedController = newPointerLockedController;
    //    };
    //
    //    void(^rollbackControllers)(void) =^{
    //        __strong typeof(weakSelf) self = weakSelf;
    //        self.statusBarController = oldStatusBarController;
    //        self.rotationController = oldRotationController;
    //        self.homeIndicatorController = oldHomeIndicatorController;
    //        self.screenEdgesController = oldScreenEdgesController;
    //        self.pointerLockedController = oldPointerLockedController;
    //    };
    
    NSMutableArray<void(^)(void)> *prepareViews      = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<void(^)(void)> *startTransitions  = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<void(^)(void)> *appearWillStarts  = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<void(^)(void)> *appearWillCancels = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<void(^)(void)> *appearDidCancels  = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<void(^)(void)> *appeareDidFinishs = [NSMutableArray arrayWithCapacity:sortedCount];
    NSMutableArray<id>            *animators         = [NSMutableArray arrayWithCapacity:sortedCount];// retain animator for animationEnded:
    
    __block  BOOL appeared = NO, shouldCancel = NO;
    
    void(^prepareView)(void) = ^{
        [prepareViews enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
    };
    
    void(^startTransition)(void) = ^{
        [startTransitions enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
    };
    
    void(^willStart)(void) = ^{
        __strong typeof (weakSelf) self = weakSelf;
        appeared = self.view.superview?YES:NO;
        //        applyControllers();
        [appearWillStarts enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
    };
    
    void(^willCancel)(void) = ^{
        shouldCancel = YES;
        [appearWillCancels enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
    };
    
    void(^didCancel)(void) = ^{
        __strong typeof(weakSelf) self = weakSelf;
        self.interactor = nil;
        [appearDidCancels enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
        //        rollbackControllers();
        dispatch_semaphore_signal(self.sempaphore);
        if (completion){
            completion(NO);
        }
        [animators removeAllObjects];
    };
    
    void(^didFinish)(void) = ^{
        __strong typeof(weakSelf) self = weakSelf;
        self.interactor = nil;
        [appeareDidFinishs enumerateObjectsUsingBlock:^(void (^obj)(void), NSUInteger idx, BOOL *stop) {
            obj();
        }];
        dispatch_semaphore_signal(self.sempaphore);
        if (completion){
            completion(YES);
        }
        [animators removeAllObjects];
    };
    BOOL isPop = estimatedOperation == UINavigationControllerOperationPop;
    BOOL nextIsTransparentAndVisble = YES;
    UIView *selfView = ({
        __block UIView *v = nil;
        Main(^{
            v = self.view;
        });
        v;
    });
    for (NSInteger c = sortedCount-1, i=c; i>=0; i--){
        UINavigationController *navigationController = sortedNavigationController[i];
        UINavigationController *fromViewController, *toViewController;
        UINavigationControllerOperation operation = UINavigationControllerOperationNone;
        __block id<UIViewControllerAnimatedTransitioning> animator;
        BOOL oldVisible = ({
            __block BOOL v;
            Main(^{
                v = navigationController.view.superview == selfView;
            });
            v;
        });
        BOOL newVisible = YES;
        BOOL isAnimated = animated;
        BOOL inOld = [oldNavigationControllers containsObject:navigationController];
        BOOL inNew = [newNavigationControllers containsObject:navigationController];
        if (!inNew){
            // pop
            newVisible = NO;
            fromViewController = navigationController;
            toViewController = i==0?nil:sortedNavigationController[i-1];
            operation = UINavigationControllerOperationPop;
            isAnimated = animated && toViewController;
            Main(^{
                __strong typeof(weakSelf) self = weakSelf;
                if ([self.delegate respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]){
                    animator = [self.delegate navigationController:self animationControllerForOperation:operation fromViewController:fromViewController.uu_viewController toViewController:toViewController?toViewController.uu_viewController:({
                        UINavigationController *v = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
                        v;
                    })];
                }
            });
            if (!animator){
                animator = [UUPushAnimator animatorWithOperation:operation];
            }
        }else {
            // push
            newVisible = nextIsTransparentAndVisble;
            fromViewController = i==0?nil:sortedNavigationController[i-1];
            toViewController = navigationController;
            operation = UINavigationControllerOperationPush;
            isAnimated = animated && !inOld && fromViewController;
            Main(^{
                __strong typeof(weakSelf) self = weakSelf;
                if ([self.delegate respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]){
                    animator = [self.delegate navigationController:self animationControllerForOperation:operation fromViewController:fromViewController?fromViewController.uu_viewController:({
                        UINavigationController *v = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
                        v;
                    }) toViewController:toViewController.uu_viewController];
                }
            });
            if (!animator){
                animator = [UUPushAnimator animatorWithOperation:operation];
            }
            if ([animator conformsToProtocol:@protocol(UUViewControllerAnimatedTransitioning)]){
                nextIsTransparentAndVisble = newVisible && [(id<UUViewControllerAnimatedTransitioning>)animator transparent];
            }else{
                nextIsTransparentAndVisble = NO;
            }
            if (!newVisible ||(oldVisible && newVisible)){
                continue;
            }
        }
    
        BOOL backItemVisible = (newVisible && navigationController != newNavigationControllers[0]) || (oldVisible && navigationController != oldNavigationControllers[0]);
        /// prepare views
        [prepareViews uu_addObject:^{
            __strong typeof(weakSelf) self = weakSelf;
            if (!oldVisible && !newVisible){
                return;
            }
            if (oldVisible){
                [self.view bringSubviewToFront:navigationController.view];
            }else if (newVisible){
                [self.view addSubview:navigationController.view];
            }
            navigationController.uu_backItemVisible = backItemVisible;
        } reversed:YES];
        // appear
        [appearWillStarts uu_addObject:^{
            __strong typeof(weakSelf) self = weakSelf;
            if (oldVisible && !newVisible){
                [navigationController willMoveToParentViewController:nil];
                if(appeared) [navigationController beginAppearanceTransition:NO animated:isAnimated];
                return;
            }
            if (!oldVisible && newVisible){
                [self uu_addChildViewController:navigationController];
                if(appeared) {
                    if ([self.delegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]){
                        [self.delegate navigationController:self willShowViewController:navigationController animated:isAnimated];
                    }
                    [navigationController beginAppearanceTransition:YES animated:isAnimated];
                }
                return;
            }
        } reversed:!isPop];
        [appearWillCancels uu_addObject:^{
            if (oldVisible && !newVisible){
                [navigationController removeFromParentViewController];
                [self uu_addChildViewController:navigationController];
                if(appeared) [navigationController beginAppearanceTransition:YES animated:isAnimated];
                return;
            }
            if (!oldVisible && newVisible){
                [navigationController didMoveToParentViewController:self];
                [navigationController willMoveToParentViewController:nil];
                if(appeared) [navigationController beginAppearanceTransition:NO animated:isAnimated];
                return;
            }
        } reversed:!isPop];
        [appearDidCancels uu_addObject:^{
            __strong typeof(weakSelf) self = weakSelf;
            if (oldVisible && !newVisible){
                [navigationController didMoveToParentViewController:self];
                if(appeared) [navigationController endAppearanceTransition];
                return;
            }
            if (!oldVisible && newVisible){
                [navigationController.view removeFromSuperview];
                [navigationController removeFromParentViewController];
                if(appeared) [navigationController endAppearanceTransition];
                return;
            }
        } reversed:isPop];
        [appeareDidFinishs uu_addObject:^{
            __strong typeof(weakSelf) self = weakSelf;
            if (oldVisible && !newVisible){
                [navigationController.view removeFromSuperview];
                if(appeared) [navigationController endAppearanceTransition];
                [navigationController removeFromParentViewController];
                return;
            }
            if (!oldVisible && newVisible){
                [navigationController didMoveToParentViewController:self];
                if(appeared) {
                    [navigationController endAppearanceTransition];
                    if ([self.delegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]){
                        [self.delegate navigationController:self didShowViewController:navigationController animated:isAnimated];
                    }
                }
#if TARGET_OS_IOS
                navigationController.interactivePopGestureRecognizer.enabled = NO;
#endif
                return;
            }
        } reversed:isPop];
        
        [animators addObject:animator];
        UU__UIViewControllerOneToOneTransitionContext *context = [[NSClassFromString(@"_UIViewControllerOneToOneTransitionContext") alloc] init];
        [context uu__setContainerView:selfView];
        [context uu__setIsAnimated:isAnimated];
        [context uu__setFromViewController:fromViewController];
        [context uu__setToViewController:toViewController];
        [context uu__setAnimator:animator];
        [context uu__setAllowUserInteraction:false];
        [context uu__setCompletionCurve:7];
        [context uu__setState:1];
        [context uu__setTransitionIsInFlight:true];
        [context uu__setDuration:[animator transitionDuration:(id<UIViewControllerContextTransitioning>)context]];
        __weak typeof(context) weakContext = context;
        [context uu__setDidCompleteHandler:^{
            dispatch_group_leave(group);
            [weakContext uu__setIsAnimated:false];
            [weakContext uu__setState:0];
            [weakContext uu__setTransitionIsInFlight:0];
            [weakContext uu__setAnimator:nil];
            [weakContext uu__setInteractor:nil];
        }];
        id<UIViewControllerInteractiveTransitioning> interactor;
        if (c == i){
            Main(^{
                __strong typeof(weakSelf) self = weakSelf;
                if ([self.delegate respondsToSelector:@selector(navigationController:interactionControllerForAnimationController:)]){
                    self.interactor = [self.delegate navigationController:self interactionControllerForAnimationController:animator];
                }
            });
            interactor = self.interactor;
            [context setUu_willCancel:^{
                willCancel();
            }];
            [context uu__setInitiallyInteractive:true];
            [context uu__setCurrentlyInteractive:true];
            [context uu__setInteractor:interactor];
        }
        [appearWillCancels uu_addObject:^{
            [weakContext uu_setTransitionWasCancelled:YES];
        } reversed:!isPop];
        
        __weak typeof(interactor) weakInteractor = interactor;
        [startTransitions uu_addObject:^{
            dispatch_group_enter(group);
            NSMutableArray *disabledViews = [NSMutableArray array];
            if (fromViewController){
                [disabledViews addObject:fromViewController.view];
            }
            if (toViewController){
                [disabledViews addObject:toViewController.view];
            }
            [context uu__disableInteractionForViews:disabledViews];
            [context uu___runAlongsideAnimations];
            if (weakInteractor){
                [weakInteractor startInteractiveTransition:(id<UIViewControllerContextTransitioning>)context];
            }else{
                [animator animateTransition:(id<UIViewControllerContextTransitioning>)context];
            }
        } reversed:YES];
    }
    Main(^{
        willStart();
        prepareView();
        startTransition();
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if(shouldCancel){
            didCancel();
            return;
        }
        didFinish();
    });
}

- (void)uu_addChildViewController:(UIViewController *)childController{
    NSAssert(0, @"Do not call this method directly");
    return;
}



- (BOOL)shouldAutomaticallyForwardAppearanceMethods{
    return NO;
}

//#if TARGET_OS_TV
//- (void)setUserInterfaceStyleController:(UINavigationController *)userInterfaceStyleController{
//    _userInterfaceStyleController = userInterfaceStyleController;
//    if (@available(tvOS 11.0, *)) {
//        [self setNeedsUserInterfaceAppearanceUpdate];
//    }
//}
//- (UIUserInterfaceStyle)preferredUserInterfaceStyle{
//    if (!self.userInterfaceStyleController) return [super preferredUserInterfaceStyle];
//    return [self.userInterfaceStyleController preferredUserInterfaceStyle];
//}
//
//#endif

#if TARGET_OS_IOS

- (void)pan:(UIScreenEdgePanGestureRecognizer*)gestureRecognizer{
    UIView *view = gestureRecognizer.view;
    UIView *superview=view.superview;
    CGPoint point=[gestureRecognizer locationInView:superview];
    UIPercentDrivenInteractiveTransition *interactor = self.interactor;
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            if (self.navigationControllers.count<2){
                break;
            }
            //            if (!self.viewControllers.lastObject.uu.interactivePopGestureRecognizerEnabled){
            //                break;
            //            }
            if (!interactor){
                interactor = [[UIPercentDrivenInteractiveTransition alloc] init];
                self.interactor = interactor;
            }
            if (![self popViewControllerAnimated:YES completion:nil]){
                break;
            }
            _interactorStartPoint = point;
        }
            break;
        case UIGestureRecognizerStateChanged:
            [interactor updateInteractiveTransition:(point.x-_interactorStartPoint.x)/CGRectGetWidth(view.bounds)];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            CGPoint velocity=[(UIPanGestureRecognizer*)gestureRecognizer velocityInView:superview];
            CGFloat width = CGRectGetWidth(view.bounds);
            if (velocity.x>1000){
                [interactor finishInteractiveTransition];
            }else if (point.x-_interactorStartPoint.x>width/4.0){
                [interactor finishInteractiveTransition];
            } else {
                [interactor cancelInteractiveTransition];
            }
        }break;
        default: break;
    }
}

- (UIGestureRecognizer*)interactivePopGestureRecognizer{
    if (__interactivePopGestureRecognizer) return __interactivePopGestureRecognizer;
    __interactivePopGestureRecognizer = ({
        UIScreenEdgePanGestureRecognizer *v = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        v.edges = UIRectEdgeLeft;
        v;
    });
    return __interactivePopGestureRecognizer;
}

//- (void)setStatusBarController:(UINavigationController *)statusBarController{
//    _statusBarController=statusBarController;
//    [self setNeedsStatusBarAppearanceUpdate];
//}
//
//- (void)setRotationController:(UINavigationController *)rotationController{
//    _rotationController = rotationController;
//    [UIViewController attemptRotationToDeviceOrientation];
//}
//
//- (void)setHomeIndicatorController:(UINavigationController *)homeIndicatorController{
//    _homeIndicatorController = homeIndicatorController;
//    if (@available(iOS 11.0, *)) {
//        [self setNeedsUpdateOfHomeIndicatorAutoHidden];
//    } else {
//
//    }
//}
//
//- (void)setScreenEdgesController:(UINavigationController *)screenEdgesController{
//    _screenEdgesController = screenEdgesController;
//    if (@available(iOS 11.0, *)) {
//        [self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
//    } else {
//
//    }
//}
//
//- (void)setPointerLockedController:(UINavigationController *)pointerLockedController{
//    _pointerLockedController = pointerLockedController;
//    if (@available(iOS 14.0, *)) {
//        [self setNeedsUpdateOfPrefersPointerLocked];
//    } else {
//
//    }
//}
//
//- (BOOL)prefersHomeIndicatorAutoHidden {
//    if (!self.homeIndicatorController) return [super prefersHomeIndicatorAutoHidden];
//    return [self.homeIndicatorController prefersHomeIndicatorAutoHidden];
//}
//
//- (BOOL)prefersPointerLocked{
//    if (!self.pointerLockedController) return [super prefersPointerLocked];
//    return [self.homeIndicatorController prefersPointerLocked];
//}
//- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures{
//    if (!self.screenEdgesController) return [super preferredScreenEdgesDeferringSystemGestures];
//    return [self.screenEdgesController preferredScreenEdgesDeferringSystemGestures];
//}
//
//- (BOOL)shouldAutorotate{
//    if (!self.rotationController) return [super shouldAutorotate];
//    return [self.rotationController shouldAutorotate];
//}
//
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if ([self.delegate respondsToSelector:@selector(navigationControllerSupportedInterfaceOrientations:)]){
        return [self.delegate navigationControllerSupportedInterfaceOrientations:self];
    }
    return [super supportedInterfaceOrientations];
    //    if (!self.rotationController) return [super supportedInterfaceOrientations];
    //    return [self.rotationController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if ([self.delegate respondsToSelector:@selector(navigationControllerPreferredInterfaceOrientationForPresentation:)]){
        return [self.delegate navigationControllerPreferredInterfaceOrientationForPresentation:self];
    }
    return [super preferredInterfaceOrientationForPresentation];
    //    if (!self.rotationController) return [super preferredInterfaceOrientationForPresentation];
    //    return [self.rotationController preferredInterfaceOrientationForPresentation];
}

//- (BOOL)prefersStatusBarHidden{
//    if (!self.statusBarController) return [super prefersStatusBarHidden];
//    return [self.statusBarController prefersStatusBarHidden];
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    if (!self.statusBarController) return [super preferredStatusBarStyle];
//    return [self.statusBarController preferredStatusBarStyle];
//}
//
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
//    if (!self.statusBarController) return [super preferredStatusBarUpdateAnimation];
//    return [self.statusBarController preferredStatusBarUpdateAnimation];
//}
#endif

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableArray *array = [NSMutableArray array];
    for (UIViewController *viewController in self.navigationControllers){
        if (viewController.view.superview != self.view) continue;
        [array addObject:viewController];
        if ([self.delegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]){
            [self.delegate navigationController:self willShowViewController:viewController animated:animated];
        }
        [viewController beginAppearanceTransition:YES animated:animated];
        [self uu_addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
    }
    self.viewWillAppearAppearances = array;
}

- (void)viewDidAppear:(BOOL)animated{
    for (UIViewController *viewController in self.viewWillAppearAppearances){
        [viewController endAppearanceTransition];
        if ([self.delegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]){
            [self.delegate navigationController:self didShowViewController:viewController animated:animated];
        }
    }
    self.viewWillAppearAppearances = nil;
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSMutableArray *array = [NSMutableArray array];
    for (UIViewController *viewController in self.navigationControllers){
        if (viewController.view.superview != self.view) continue;
        [array addObject:viewController];
        [viewController beginAppearanceTransition:NO animated:animated];
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    self.viewWillDisappearAppearances = array;
}

- (void)viewDidDisappear:(BOOL)animated{
    for (UIViewController *viewController in self.viewWillDisappearAppearances){
        [viewController endAppearanceTransition];
    }
    self.viewWillDisappearAppearances = nil;
    [super viewDidDisappear:animated];
}

- (Class)navigationControllerClass{
    if (_navigationControllerClass){
        return _navigationControllerClass;
    }
    _navigationControllerClass = UINavigationController.class;
    return _navigationControllerClass;
}

- (Class)navigationBarClass{
    if (_navigationBarClass){
        return _navigationBarClass;
    }
    _navigationBarClass = UINavigationBar.class;
    return _navigationBarClass;
}
#if TARGET_IOS
- (Class)toolBarClass{
    if (_toolBarClass){
        return _toolBarClass;
    }
    _toolBarClass = UIToolbar.class;
    return _toolBarClass;
}
#endif

- (UIViewController*)topViewController{
    return self.navigationControllers.lastObject.uu_viewController;
}

- (NSArray<UIViewController *> *)viewControllers{
    return ({
        NSMutableArray *v = [NSMutableArray arrayWithCapacity:self.navigationControllers.count];
        [self.navigationControllers enumerateObjectsUsingBlock:^(UINavigationController * obj, NSUInteger idx, BOOL *stop) {
            [v addObject:obj.uu_viewController];
        }];
        [v?v:@[] copy];
    });
}

- (dispatch_queue_t)queue{
    if (_queue) return _queue;
    _queue = dispatch_queue_create("com.neutronstarer.stacknavigationcontroller", DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(_queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));
    return _queue;
}

- (dispatch_semaphore_t)sempaphore{
    if (_sempaphore) return _sempaphore;
    _sempaphore = dispatch_semaphore_create(1);
    return _sempaphore;
}

+ (void)load{
    [self uu_swizzleOriginalSelector:@selector(addChildViewController:) alteredSelector:@selector(uu_addChildViewController:)];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
