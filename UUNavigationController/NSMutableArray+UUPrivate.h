//
//  NSMutableArray+UUPrivate.h
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray<ObjectType> (UUPrivate)

- (void)uu_addObject:(ObjectType)object reversed:(BOOL)reversed;

@end

NS_ASSUME_NONNULL_END
