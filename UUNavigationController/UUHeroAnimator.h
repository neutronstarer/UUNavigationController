//
//  UUHeroAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2022/1/9.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UUHeroAnimator :NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
