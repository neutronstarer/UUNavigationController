//
//  NSMutableArray+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import "NSMutableArray+UUPrivate.h"

@implementation NSMutableArray (UUPrivate)

- (void)uu_addObject:(id)object reversed:(BOOL)reversed{
    if (reversed){
        [self insertObject:object atIndex:0];
        return;
    }
    [self addObject:object];
}

@end
