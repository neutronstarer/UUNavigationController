//
//  NSObject+UUPrivate.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UUPrivate)

+ (void)uu_swizzleOriginalSelector:(SEL)originalSelector alteredSelector:(SEL)alteredSelector;

+ (void)uu_swizzleClass:(Class)cls originalSelector:(SEL)originalSelector alteredSelector:(SEL)alteredSelector;

@end

NS_ASSUME_NONNULL_END
