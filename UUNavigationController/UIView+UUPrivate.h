//
//  UIView+UUPrivate.h
//  UUNavigationController
//
//  Created by neutronstarer on 2022/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UUPrivate)

@property (nonatomic, copy) NSString *uu_heroId;
- (NSArray*)findAllHeroSubviews;
- (UIView*)findSpecialHeroSubviewById:(NSString*)heroId;

@end

NS_ASSUME_NONNULL_END
