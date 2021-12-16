//
//  UIViewController+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/runtime.h>

#import "UIViewController+UUPrivate.h"
#import "UUNavigationController.h"

@implementation UIViewController (UUPrivate)

- (UUNavigationController *)uu_navigationController{
    if ([self isKindOfClass:UINavigationController.class]) {
        return [objc_getAssociatedObject(self, @selector(uu_navigationController)) anyObject];
    }
    return [self.navigationController uu_navigationController];
}

- (void)setUu_navigationController:(UUNavigationController *)uu_navigationController{
    objc_setAssociatedObject(self, @selector(uu_navigationController), uu_navigationController ? ({
        NSHashTable *v = [NSHashTable weakObjectsHashTable];
        [v addObject:uu_navigationController];
        v;
    }): nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
