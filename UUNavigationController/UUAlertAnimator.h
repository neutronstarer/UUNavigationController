//
//  UUAlertAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/5.
//

@import UIKit;

#import <UUNavigationController/UUViewControllerAnimatedTransitioning.h>

NS_ASSUME_NONNULL_BEGIN
/// Alert style
@interface UUAlertAnimator : NSObject<UUViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
