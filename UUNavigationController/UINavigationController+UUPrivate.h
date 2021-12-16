//
//  UINavigationController+UUPrivate.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (UUPrivate)

@property (nonatomic, copy, nullable  ) void(^uu_pop)(__kindof UINavigationController *navigationController);
@property (nonatomic, assign          ) BOOL             uu_backItemVisible;
@property (nonatomic, strong, nullable) UIViewController *uu_viewController;

- (void)uu_setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers;

@end

NS_ASSUME_NONNULL_END
