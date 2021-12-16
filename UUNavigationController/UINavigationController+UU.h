//
//  UINavigationController+UU.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (UU)
/// `uu_pop` Back item did click, pop action trigged.
@property (nonatomic, copy, nullable) void(^uu_pop)(__kindof UINavigationController *navigationController);

@end

NS_ASSUME_NONNULL_END
