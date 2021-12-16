//
//  UUNavigationControllerDelegate.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/25.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@class UUNavigationController;

NS_SWIFT_UI_ACTOR
@protocol UUNavigationControllerDelegate <NSObject>

@optional

- (void)navigationController:(UUNavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)navigationController:(UUNavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UUNavigationController *)navigationController API_UNAVAILABLE(tvos);
- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UUNavigationController *)navigationController API_UNAVAILABLE(tvos);

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UUNavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController;

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UUNavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController * _Nullable)fromVC
                                                           toViewController:(UIViewController * _Nullable)toVC;

@end

NS_ASSUME_NONNULL_END
