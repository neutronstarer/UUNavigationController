//
//  NSArray+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import "NSArray+UUPrivate.h"

@implementation NSArray (UUPrivate)

- (NSArray *)uu_unique{
    NSMutableArray *v = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([v containsObject:obj]){
            return;
        }
        [v insertObject:obj atIndex:0];
    }];
    return v;
}

@end
