//
//  UUTransparentBackgroundView.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UUTransparentBackgroundView : UIView

@property (nonatomic, copy, nullable) void(^tapHandle)(void);

@end

@interface UIView (UU)

/// Add a view below self as background
- (UUTransparentBackgroundView*)uu_addTransparentBackgroundView;
/// adjust
- (void)uu_adjustTransparentBackgroundView;
/// Remove transparent view
- (void)uu_removeTransparentBackgroundView;

@end

NS_ASSUME_NONNULL_END
