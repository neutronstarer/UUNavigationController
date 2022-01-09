//
//  UIView+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2022/1/9.
//

#import <objc/runtime.h>
#import "UIView+UUPrivate.h"

@implementation UIView (UUPrivate)

- (void)setUu_heroId:(NSString *)uu_heroId {
    objc_setAssociatedObject(self, @selector(uu_heroId), uu_heroId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString*)uu_heroId {
    return objc_getAssociatedObject(self, @selector(uu_heroId));
}

- (NSArray*)findAllHeroSubviews{
    NSMutableArray *views = [NSMutableArray array];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.uu_heroId){
            [views addObject:obj];
        }
        [views addObjectsFromArray:[obj findAllHeroSubviews]];
    }];
    return views;
}

- (UIView*)findSpecialHeroSubviewById:(NSString*)heroId{
    for (UIView *view in self.subviews) {
        if ([view.uu_heroId isEqualToString:heroId]){
            return view;
        }
        UIView *v = [view findSpecialHeroSubviewById:heroId];
        if ([v.uu_heroId isEqualToString:heroId]){
            return v;
        }
    }
    return nil;
}

@end
