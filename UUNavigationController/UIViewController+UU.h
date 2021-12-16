//
//  UIViewController+UUPublic.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@class UUNavigationController;

@interface UIViewController (UU)
/// UUNavigationController
@property (nonatomic, weak, nullable, readonly) UUNavigationController *uu_navigationController;

@end

NS_ASSUME_NONNULL_END
