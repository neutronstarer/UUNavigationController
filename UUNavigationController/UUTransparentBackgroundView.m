//
//  UUTransparentBackgroundView.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/runtime.h>

#import "NSObject+UUPrivate.h"
#import "UUTransparentBackgroundView.h"

@interface UUTransparentBackgroundView()

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation UUTransparentBackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.alpha = 0;
    self.backgroundColor = [UIColor blackColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    return self;
}

- (void)setTapHandle:(void (^)(void))tapHandler{
    _tapHandle = tapHandler;
    if (tapHandler){
        if (self.tapGestureRecognizer){
            return;
        }
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        return;
    }
    if (!self.tapGestureRecognizer){
        return;
    }
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer = nil;
}

- (void)tap{
    if (!self.tapHandle){
        return;
    }
    self.tapHandle();
}

@end

@implementation UIView (UU)

- (void)setUu_transparentBackgroundView:(UUTransparentBackgroundView *)uu_transparentBackgroundView{
    objc_setAssociatedObject(self, @selector(uu_transparentBackgroundView), ({
        NSHashTable *v = [NSHashTable weakObjectsHashTable];
        [v addObject:uu_transparentBackgroundView];
        v;
    }), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UUTransparentBackgroundView *)uu_transparentBackgroundView{
    return [objc_getAssociatedObject(self, @selector(uu_transparentBackgroundView)) anyObject];
}

- (UIView*)uu_addTransparentBackgroundView{
    UUTransparentBackgroundView *view = [self uu_transparentBackgroundView];
    if (!view) {
        view = ({
            UUTransparentBackgroundView *v = [[UUTransparentBackgroundView alloc] init];
            v;
        });
        [self setUu_transparentBackgroundView:view];
    }
    [self uu_adjustTransparentBackgroundView];
    return view;
}

- (void)uu_removeTransparentBackgroundView {
    UUTransparentBackgroundView *view = [self uu_transparentBackgroundView];
    if (!view) return;
    [view removeFromSuperview];
    [self setUu_transparentBackgroundView:nil];
}

- (void)uu_adjustTransparentBackgroundView{
    UUTransparentBackgroundView *view = [self uu_transparentBackgroundView];
    if (!view){
        return;
    }
    if (!self.superview || self.hidden) {
        [view removeFromSuperview];
        return;
    }
    [self.superview insertSubview:view belowSubview:self];
    view.frame = self.superview.bounds;
}

- (void)uu_didMoveToSuperview{
    [self uu_adjustTransparentBackgroundView];
    [self uu_didMoveToSuperview];
}

+ (void)load{
    [self uu_swizzleOriginalSelector:@selector(didMoveToSuperview) alteredSelector:@selector(uu_didMoveToSuperview)];
}

@end
