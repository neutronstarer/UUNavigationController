//
//  UUPresentAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/10.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
// Present style.
@interface UUPresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
