//
//  UINavigationController+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/runtime.h>

#import "NSObject+UUPrivate.h"
#import "UINavigationController+UUPrivate.h"
#import "UIViewController+UUPrivate.h"
#import "UUNavigationController+UU.h"

@implementation UINavigationController (UUPrivate)

- (void)setUu_pop:(void (^)(__kindof UINavigationController *))uu_pop{
    objc_setAssociatedObject(self, @selector(uu_pop), uu_pop, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(__kindof UINavigationController *))uu_pop{
    return objc_getAssociatedObject(self, @selector(uu_pop));
}

- (BOOL)uu_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    if (self.uu_pop){
        self.uu_pop(self);
        return NO;
    }
    if (!self.uu_navigationController){
        return [self uu_navigationBar:navigationBar shouldPopItem:item];
    }
    [self.uu_navigationController popViewControllerAnimated:YES];
    return NO;
}

- (BOOL)uu_backItemVisible{
    return [objc_getAssociatedObject(self, @selector(uu_backItemVisible)) boolValue];
}

- (void)setUu_backItemVisible:(BOOL)uu_backItemVisible{
    if (self.uu_backItemVisible == uu_backItemVisible){
        return;
    }
    objc_setAssociatedObject(self, @selector(uu_backItemVisible), @(uu_backItemVisible), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIViewController *viewController = self.uu_viewController;
    if (viewController){
        [self uu_setViewControllers:uu_backItemVisible?@[[[UIViewController alloc]init], viewController]:@[viewController] animated:NO];
        self.navigationBarHidden = !self.navigationBarHidden;
        self.navigationBarHidden = !self.navigationBarHidden;
    }else{
        [self uu_setViewControllers:@[] animated:NO];
    }
}

- (void)uu_viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    //fix transform bug while rotating
    if (self.uu_navigationController){
        CATransform3D transform = self.view.layer.transform;
        self.view.layer.transform = CATransform3DIdentity;
        // next runloop
        [self performSelector:@selector(uu_setViewLayerTransform:) withObject:@(transform) afterDelay:0];
    }
    [self uu_viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)uu_setViewLayerTransform:(NSValue*)value{
    self.view.layer.transform = value.CATransform3DValue;
}

- (UIViewController*)uu_viewController{
    return objc_getAssociatedObject(self, @selector(uu_viewController));
}

- (void)setUu_viewController:(UIViewController *)uu_viewController{
    if (self.uu_viewController == uu_viewController){
        return;
    }
    objc_setAssociatedObject(self, @selector(uu_viewController), uu_viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self uu_setViewControllers:self.uu_backItemVisible?@[[[UIViewController alloc]init], uu_viewController]:@[uu_viewController] animated:NO];
}

//- (NSArray*)uu_viewControllers{
//    UUNavigationController *v = self.uu_navigationController;
//    if (!v){
//        return [self uu_viewControllers];
//    }
//    return [self.uu_navigationController viewControllers];
//}

- (void)uu_setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
        [self uu_setViewControllers:viewControllers];
        return;
    }
    [v setViewControllers:viewControllers];
}

- (void)uu_setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
         [self uu_setViewControllers:viewControllers animated:animated];
         return;
     }
     [v setViewControllers:viewControllers animated:animated];
}

- (void)uu_pushViewController:(__kindof UIViewController *)viewController animated:(BOOL)animated{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
        [self uu_pushViewController:viewController animated:animated];
        return;
    }
    [v pushViewController:viewController animated:animated];
}

- (nullable __kindof UIViewController *)uu_popViewControllerAnimated:(BOOL)animated{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
        return [self uu_popViewControllerAnimated:animated];
    }
    return [v popViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)uu_popToRootViewControllerAnimated:(BOOL)animated{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
        return [self uu_popToRootViewControllerAnimated:animated];
    }
    return [v popToRootViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)uu_popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UUNavigationController *v = self.uu_navigationController;
    if (!v){
        return [self uu_popToViewController:viewController animated:animated];
    }
    return [v popToViewController:viewController animated:animated];
}
//#if TARGET_OS_TV
//- (UIUserInterfaceStyle)uu_preferredUserInterfaceStyle API_AVAILABLE(tvos(11.0)){
//    if (!self.uu_navigationController){
//        return [self uu_preferredUserInterfaceStyle];
//    }
//    if (!self.topViewController){
//        return [self uu_preferredUserInterfaceStyle];
//    }
//    return [self.topViewController preferredUserInterfaceStyle];
//}
//#endif

//#if TARGET_OS_IOS
//- (BOOL)uu_prefersStatusBarHidden {
//    if (!self.uu_navigationController){
//        return [self uu_prefersStatusBarHidden];
//    }
//    if (!self.topViewController){
//        return [self uu_prefersStatusBarHidden];
//    }
//    return [self.topViewController prefersStatusBarHidden];
//}
//
//- (UIStatusBarStyle)uu_preferredStatusBarStyle{
//    if (!self.uu_navigationController){
//        return [self uu_preferredStatusBarStyle];
//    }
//    if (!self.topViewController){
//        return [self uu_preferredStatusBarStyle];
//    }
//    return [self.topViewController preferredStatusBarStyle];
//}
//
//- (UIStatusBarAnimation)uu_preferredStatusBarUpdateAnimation{
//    if (!self.uu_navigationController){
//        return [self uu_preferredStatusBarUpdateAnimation];
//    }
//    if (!self.topViewController){
//        return [self uu_preferredStatusBarUpdateAnimation];
//    }
//    return [self.topViewController preferredStatusBarUpdateAnimation];
//}
//
//- (BOOL)uu_shouldAutorotate{
//    if (!self.uu_navigationController){
//        return [self uu_shouldAutorotate];
//    }
//    if (!self.topViewController){
//        return [self uu_shouldAutorotate];
//    }
//    return [self.topViewController shouldAutorotate];
//}
//
//- (UIInterfaceOrientationMask)uu_supportedInterfaceOrientations{
//    if (!self.uu_navigationController){
//        return [self uu_supportedInterfaceOrientations];
//    }
//    if (!self.topViewController){
//        return [self uu_supportedInterfaceOrientations];
//    }
//    return [self.topViewController supportedInterfaceOrientations];
//}
//
//- (UIInterfaceOrientation)uu_preferredInterfaceOrientationForPresentation{
//    if (!self.uu_navigationController){
//        return [self uu_preferredInterfaceOrientationForPresentation];
//    }
//    if (!self.topViewController){
//        return [self uu_preferredInterfaceOrientationForPresentation];
//    }
//    return [self.topViewController preferredInterfaceOrientationForPresentation];
//}
//
//- (BOOL)uu_prefersHomeIndicatorAutoHidden API_AVAILABLE(ios(11.0)){
//    if (!self.uu_navigationController){
//        return [self uu_prefersHomeIndicatorAutoHidden];
//    }
//    if (!self.topViewController){
//        return [self uu_prefersHomeIndicatorAutoHidden];
//    }
//    return [self.topViewController prefersHomeIndicatorAutoHidden];
//}
//
//- (UIRectEdge)uu_preferredScreenEdgesDeferringSystemGestures API_AVAILABLE(ios(11.0)){
//    if (!self.uu_navigationController){
//        return [self uu_preferredScreenEdgesDeferringSystemGestures];
//    }
//    if (!self.topViewController){
//        return [self uu_preferredScreenEdgesDeferringSystemGestures];
//    }
//    return [self.topViewController preferredScreenEdgesDeferringSystemGestures];
//}
//
//- (BOOL)uu_prefersPointerLocked API_AVAILABLE(ios(14.0)){
//    if (!self.uu_navigationController){
//        return [self uu_prefersPointerLocked];
//    }
//    if (!self.topViewController){
//        return [self uu_prefersPointerLocked];
//    }
//    return [self.topViewController prefersPointerLocked];
//}
//#endif

+ (void)load{
//    [self uu_swizzleOriginalSelector:@selector(viewControllers) alteredSelector:@selector(uu_viewControllers)];
    [self uu_swizzleOriginalSelector:@selector(navigationBar:shouldPopItem:) alteredSelector:@selector(uu_navigationBar:shouldPopItem:)];
    [self uu_swizzleOriginalSelector:@selector(setViewControllers:) alteredSelector:@selector(uu_setViewControllers:)];
    [self uu_swizzleOriginalSelector:@selector(setViewControllers:animated:) alteredSelector:@selector(uu_setViewControllers:animated:)];
    [self uu_swizzleOriginalSelector:@selector(pushViewController:animated:) alteredSelector:@selector(uu_pushViewController:animated:)];
    [self uu_swizzleOriginalSelector:@selector(popViewControllerAnimated:) alteredSelector:@selector(uu_popViewControllerAnimated:)];
    [self uu_swizzleOriginalSelector:@selector(popToRootViewControllerAnimated:) alteredSelector:@selector(uu_popToRootViewControllerAnimated:)];
    [self uu_swizzleOriginalSelector:@selector(popToViewController:animated:) alteredSelector:@selector(uu_popToViewController:animated:)];
    [self uu_swizzleOriginalSelector:@selector(viewWillTransitionToSize:withTransitionCoordinator:) alteredSelector:@selector(uu_viewWillTransitionToSize:withTransitionCoordinator:)];
//#if TARGET_OS_TV
//    [self uu_swizzleOriginalSelector:@selector(preferredUserInterfaceStyle) alteredSelector:@selector(uu_preferredUserInterfaceStyle)];
//#endif
//#if TARGET_OS_IOS
//    [self uu_swizzleOriginalSelector:@selector(prefersStatusBarHidden) alteredSelector:@selector(uu_prefersStatusBarHidden)];
//    [self uu_swizzleOriginalSelector:@selector(preferredStatusBarStyle) alteredSelector:@selector(uu_preferredStatusBarStyle)];
//    [self uu_swizzleOriginalSelector:@selector(preferredStatusBarUpdateAnimation) alteredSelector:@selector(uu_preferredStatusBarUpdateAnimation)];
//    [self uu_swizzleOriginalSelector:@selector(shouldAutorotate) alteredSelector:@selector(uu_shouldAutorotate)];
//    [self uu_swizzleOriginalSelector:@selector(supportedInterfaceOrientations) alteredSelector:@selector(uu_supportedInterfaceOrientations)];
//    [self uu_swizzleOriginalSelector:@selector(preferredInterfaceOrientationForPresentation) alteredSelector:@selector(uu_preferredInterfaceOrientationForPresentation)];
//    if (@available(iOS 11.0, *)) {
//        [self uu_swizzleOriginalSelector:@selector(prefersHomeIndicatorAutoHidden) alteredSelector:@selector(uu_prefersHomeIndicatorAutoHidden)];
//        [self uu_swizzleOriginalSelector:@selector(preferredScreenEdgesDeferringSystemGestures) alteredSelector:@selector(uu_preferredScreenEdgesDeferringSystemGestures)];
//    }
//    if (@available(iOS 14, *)) {
//        [self uu_swizzleOriginalSelector:@selector(prefersPointerLocked) alteredSelector:@selector(uu_prefersPointerLocked)];
//    }
//#endif
}


@end
