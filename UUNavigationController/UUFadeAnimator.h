//
//  UUFadeAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/25.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
/// Fade style
@interface UUFadeAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end
NS_ASSUME_NONNULL_END
