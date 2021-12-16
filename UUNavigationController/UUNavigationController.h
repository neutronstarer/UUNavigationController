//
//  UUNavigationController.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import UIKit;

//! Project version number for UUNavigationController.
FOUNDATION_EXPORT double UUNavigationControllerVersionNumber;

//! Project version string for UUNavigationController.
FOUNDATION_EXPORT const unsigned char UUNavigationControllerVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UUNavigationController/PublicHeader.h>

#import <UUNavigationController/UUPushAnimator.h>
#import <UUNavigationController/UUAlertAnimator.h>
#import <UUNavigationController/UUActionSheetAnimator.h>
#import <UUNavigationController/UUTransparentBackgroundView.h>
#import <UUNavigationController/UIViewController+UU.h>
#import <UUNavigationController/UINavigationController+UU.h>
#import <UUNavigationController/UUPresentAnimator.h>
#import <UUNavigationController/UUFadeAnimator.h>
#import <UUNavigationController/UUNavigationControllerDelegate.h>
#import <UUNavigationController/UUViewControllerAnimatedTransitioning.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_UI_ACTOR
@interface UUNavigationController: UINavigationController

- (instancetype)initWithNavigationControllerClass:(nullable Class)navigationControllerClass NS_SWIFT_NAME(init(navigationControllerClass:));

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers NS_SWIFT_NAME(setViewController(_:));
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated NS_SWIFT_NAME(setViewControllers(_:animated:));
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(setViewControllers(_:animated:completion:));

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated NS_SWIFT_NAME(pushViewController(_:animated:));
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(pushViewController(_:animated:completion:));
- (void)pushViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated NS_SWIFT_NAME(pushViewControllers(_:animated:));
- (void)pushViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(pushViewControllers(_:animated:completion:));

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated NS_SWIFT_NAME(popViewController(animated:));
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(popViewController(animated:completion:));
- (nullable NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated NS_SWIFT_NAME(popToViewController(_:animated:));
- (nullable NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(popToViewController(_:animated:completion:));
- (nullable NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated NS_SWIFT_NAME(popToRootViewController(animated:));
- (nullable NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated completion:(void(^_Nullable)(BOOL finished))completion NS_SWIFT_NAME(popToRootViewController(animated:completion:));

@end

NS_ASSUME_NONNULL_END
