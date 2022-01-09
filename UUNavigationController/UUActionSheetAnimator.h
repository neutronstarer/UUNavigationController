//
//  UUActionSheetAnimator.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/9.
//

#import "UUViewControllerAnimatedTransitioning.h"

NS_ASSUME_NONNULL_BEGIN
// Action sheet style.
@interface UUActionSheetAnimator: NSObject<UUViewControllerAnimatedTransitioning>

+ (instancetype)animatorWithOperation:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
