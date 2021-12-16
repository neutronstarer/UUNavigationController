//
//  UUPushAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/8.
//

@import UIKit;


NS_ASSUME_NONNULL_BEGIN
/// Push style
@interface UUPushAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
