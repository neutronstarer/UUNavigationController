//
//  NSObject+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/runtime.h>

#import "NSObject+UUPrivate.h"

@implementation NSObject (UUPrivate)

+ (void)uu_swizzleOriginalSelector:(SEL)originalSelector alteredSelector:(SEL)alteredSelector{
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    class_addMethod(self, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, originalSelector), class_getInstanceMethod(self, alteredSelector));
}

+ (void)uu_swizzleClass:(Class)cls originalSelector:(SEL)originalSelector alteredSelector:(SEL)alteredSelector{
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method alteredMethod = class_getInstanceMethod(self, alteredSelector);
    class_addMethod(cls, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    class_addMethod(cls, alteredSelector, method_getImplementation(alteredMethod), method_getTypeEncoding(alteredMethod));
    method_exchangeImplementations(class_getInstanceMethod(cls, originalSelector), class_getInstanceMethod(cls, alteredSelector));
}

@end
