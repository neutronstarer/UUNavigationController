//
//  UUNavigationController+UUPublic.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/12/18.
//
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_UI_ACTOR
@interface UUNavigationController: UINavigationController

@property (nonatomic, assign) BOOL heroEnabled;

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
