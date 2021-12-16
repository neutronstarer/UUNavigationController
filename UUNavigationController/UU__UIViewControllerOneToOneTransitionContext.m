
#import <objc/runtime.h>

#import "NSObject+UUPrivate.h"
#import "UU__UIViewControllerOneToOneTransitionContext.h"

@implementation UU__UIViewControllerOneToOneTransitionContext

-(id)uu__fromView{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__fromView];
}
        

-(void)uu__setFromView:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setFromView:arg1 ];
}
        

-(void)uu__setFromViewController:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setFromViewController:arg1 ];
}
        

-(void)uu__setToView:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setToView:arg1 ];
}
        

-(void)uu__setToViewController:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setToViewController:arg1 ];
}
        

-(id)uu__toView{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__toView];
}
        

-(void)uu_dealloc{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu_dealloc];
}
        

-(id)uu_fromViewController{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_fromViewController];
}
        

-(id)uu_toViewController{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_toViewController];
}
        

-(id)uu_viewControllerForKey:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_viewControllerForKey:arg1 ];
}
        

-(id)uu_viewForKey:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_viewForKey:arg1 ];
}
        
-(void)uu___runAlongsideAnimations{
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu___runAlongsideAnimations];
}
        

-(bool)uu__allowUserInteraction{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__allowUserInteraction];
}
        

-(long long)uu__alongsideAnimationsCount{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__alongsideAnimationsCount];
}
        

-(id)uu__animator{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__animator];
}
        

-(id)uu__auxContext{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__auxContext];
}
        

-(long long)uu__completionCurve{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__completionCurve];
}
        

-(double)uu__completionVelocity{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__completionVelocity];
}
        

-(id)uu__containerViews{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__containerViews];
}
        

-(void)uu__disableInteractionForViews:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__disableInteractionForViews:arg1 ];
}
        

-(double)uu__duration{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__duration];
}
        

-(void)uu__enableInteractionForDisabledViews{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__enableInteractionForDisabledViews];
}
        

-(bool)uu__initiallyInteractive{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__initiallyInteractive];
}
        

-(void)uu__interactivityDidChange:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__interactivityDidChange:arg1 ];
}
        

-(id)uu__interactor{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__interactor];
}
        

-(bool)uu__isPresentation{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__isPresentation];
}
        

-(bool)uu__isRotating{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__isRotating];
}
        

-(double)uu__percentOffset{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__percentOffset];
}
        

-(double)uu__previousPercentComplete{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__previousPercentComplete];
}
        

-(void)uu__runAlongsideCompletions{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__runAlongsideCompletions];
}
        

-(void)uu__setAllowUserInteraction:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setAllowUserInteraction:arg1 ];
}
        

-(void)uu__setAnimator:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setAnimator:arg1 ];
}
        

-(void)uu__setAuxContext:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setAuxContext:arg1 ];
}
        

-(void)uu__setCompletionCurve:(long long)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setCompletionCurve:arg1 ];
}
        

-(void)uu__setCompletionHandler:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setCompletionHandler:arg1 ];
}
        

-(void)uu__setCompletionVelocity:(double)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setCompletionVelocity:arg1 ];
}
        

-(void)uu__setContainerView:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setContainerView:arg1 ];
}
        

-(void)uu__setContainerViews:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setContainerViews:arg1 ];
}
        

-(void)uu__setCurrentlyInteractive:(bool)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setCurrentlyInteractive:arg1 ];
}
        

-(void)uu__setDidCompleteHandler:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setDidCompleteHandler:arg1 ];
}
        

-(void)uu__setDuration:(double)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setDuration:arg1 ];
}
        

-(void)uu__setInitiallyInteractive:(bool)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setInitiallyInteractive:arg1 ];
}
        

-(void)uu__setInteractiveUpdateHandler:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setInteractiveUpdateHandler:arg1 ];
}
        

-(void)uu__setInteractor:(id)arg1 {
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setInteractor:arg1 ];
}
        

-(void)uu__setInterruptible:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setInterruptible:arg1 ];
}
        

-(void)uu__setIsAnimated:(bool)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setIsAnimated:arg1 ];
}
        

-(void)uu__setIsPresentation:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setIsPresentation:arg1 ];
}
        

-(void)uu__setPercentOffset:(double)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setPercentOffset:arg1 ];
}
        

-(void)uu__setPostInteractiveCompletionHandler:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setPostInteractiveCompletionHandler:arg1 ];
}
        

-(void)uu__setPresentationStyle:(long long)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setPresentationStyle:arg1 ];
}
        

-(void)uu__setPreviousPercentComplete:(double)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setPreviousPercentComplete:arg1 ];
}
        

-(void)uu__setRotating:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setRotating:arg1 ];
}
        

-(void)uu__setState:(long long)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setState:arg1 ];
}
        

-(void)uu__setTransitionIsCompleting:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setTransitionIsCompleting:arg1 ];
}
        

-(void)uu__setTransitionIsInFlight:(bool)arg1 {
//    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__setTransitionIsInFlight:arg1 ];
}
        

-(void)uu__setWillCompleteHandler:(id)arg1 {
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__setWillCompleteHandler:arg1 ];
}
        

-(long long)uu__state{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__state];
}
        

-(void)uu__stopInteractiveTransition{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu__stopInteractiveTransition];
}
        

-(id)uu__transitionCoordinator{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__transitionCoordinator];
}
        

-(bool)uu__transitionIsCompleting{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__transitionIsCompleting];
}
        

-(bool)uu__transitionIsInFlight{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu__transitionIsInFlight];
}
        

-(void)uu__updateInteractiveTransitionWithoutTrackingPercentComplete:(double)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu__updateInteractiveTransitionWithoutTrackingPercentComplete:arg1 ];
}
        

-(void)uu_cancelInteractiveTransition{
//    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    if (self.uu_willCancel) self.uu_willCancel();
    [self uu_cancelInteractiveTransition];
}
        

-(void)uu_completeTransition:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu_completeTransition:arg1 ];
}
        

-(id)uu_containerView{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_containerView];
}

-(void)uu_finishInteractiveTransition{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu_finishInteractiveTransition];
}
        

-(id)uu_init{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_init];
}
        

-(bool)uu_initiallyInteractive{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_initiallyInteractive];
}
        

-(bool)uu_isAnimated{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_isAnimated];
}
        

-(bool)uu_isCurrentlyInteractive{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_isCurrentlyInteractive];
}
        

-(bool)uu_isInteractive{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_isInteractive];
}
        

-(bool)uu_isInterruptible{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_isInterruptible];
}
        

-(void)uu_pauseInteractiveTransition{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    [self uu_pauseInteractiveTransition];
}
        

-(long long)uu_presentationStyle{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_presentationStyle];
}
        

-(void)uu_setTransitionWasCancelled:(bool)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu_setTransitionWasCancelled:arg1 ];
}
        

-(bool)uu_transitionWasCancelled{
    NSLog(@"[%@ %@]", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    return [self uu_transitionWasCancelled];
}
        

-(void)uu_updateInteractiveTransition:(double)arg1 {
    NSLog(@"[%@ %@] %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd), @(arg1));
    [self uu_updateInteractiveTransition:arg1 ];
}
        
-(void(^)(void))uu_willCancel{
    return objc_getAssociatedObject(self, @selector(uu_willCancel));
}

-(void)setUu_willCancel:(void(^)(void))block{
    objc_setAssociatedObject(self, @selector(uu_willCancel), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
        

+ (void)load{
    Class cls = NSClassFromString(@"_UIViewControllerOneToOneTransitionContext");
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"__runAlongsideAnimations") alteredSelector: @selector(uu___runAlongsideAnimations)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_allowUserInteraction") alteredSelector: @selector(uu__allowUserInteraction)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_alongsideAnimationsCount") alteredSelector: @selector(uu__alongsideAnimationsCount)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_animator") alteredSelector: @selector(uu__animator)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_auxContext") alteredSelector: @selector(uu__auxContext)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_completionCurve") alteredSelector: @selector(uu__completionCurve)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_completionVelocity") alteredSelector: @selector(uu__completionVelocity)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_containerViews") alteredSelector: @selector(uu__containerViews)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_disableInteractionForViews:") alteredSelector: @selector(uu__disableInteractionForViews:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_duration") alteredSelector: @selector(uu__duration)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_enableInteractionForDisabledViews") alteredSelector: @selector(uu__enableInteractionForDisabledViews)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_initiallyInteractive") alteredSelector: @selector(uu__initiallyInteractive)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_interactivityDidChange:") alteredSelector: @selector(uu__interactivityDidChange:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_interactor") alteredSelector: @selector(uu__interactor)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_isPresentation") alteredSelector: @selector(uu__isPresentation)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_isRotating") alteredSelector: @selector(uu__isRotating)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_percentOffset") alteredSelector: @selector(uu__percentOffset)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_previousPercentComplete") alteredSelector: @selector(uu__previousPercentComplete)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_runAlongsideCompletions") alteredSelector: @selector(uu__runAlongsideCompletions)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setAllowUserInteraction:") alteredSelector: @selector(uu__setAllowUserInteraction:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setAnimator:") alteredSelector: @selector(uu__setAnimator:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setAuxContext:") alteredSelector: @selector(uu__setAuxContext:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setCompletionCurve:") alteredSelector: @selector(uu__setCompletionCurve:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setCompletionHandler:") alteredSelector: @selector(uu__setCompletionHandler:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setCompletionVelocity:") alteredSelector: @selector(uu__setCompletionVelocity:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setContainerView:") alteredSelector: @selector(uu__setContainerView:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setContainerViews:") alteredSelector: @selector(uu__setContainerViews:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setCurrentlyInteractive:") alteredSelector: @selector(uu__setCurrentlyInteractive:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setDidCompleteHandler:") alteredSelector: @selector(uu__setDidCompleteHandler:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setDuration:") alteredSelector: @selector(uu__setDuration:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setInitiallyInteractive:") alteredSelector: @selector(uu__setInitiallyInteractive:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setInteractiveUpdateHandler:") alteredSelector: @selector(uu__setInteractiveUpdateHandler:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setInteractor:") alteredSelector: @selector(uu__setInteractor:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setInterruptible:") alteredSelector: @selector(uu__setInterruptible:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setIsAnimated:") alteredSelector: @selector(uu__setIsAnimated:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setIsPresentation:") alteredSelector: @selector(uu__setIsPresentation:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setPercentOffset:") alteredSelector: @selector(uu__setPercentOffset:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setPostInteractiveCompletionHandler:") alteredSelector: @selector(uu__setPostInteractiveCompletionHandler:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setPresentationStyle:") alteredSelector: @selector(uu__setPresentationStyle:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setPreviousPercentComplete:") alteredSelector: @selector(uu__setPreviousPercentComplete:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setRotating:") alteredSelector: @selector(uu__setRotating:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setState:") alteredSelector: @selector(uu__setState:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setTransitionIsCompleting:") alteredSelector: @selector(uu__setTransitionIsCompleting:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setTransitionIsInFlight:") alteredSelector: @selector(uu__setTransitionIsInFlight:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setWillCompleteHandler:") alteredSelector: @selector(uu__setWillCompleteHandler:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_state") alteredSelector: @selector(uu__state)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_stopInteractiveTransition") alteredSelector: @selector(uu__stopInteractiveTransition)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_transitionCoordinator") alteredSelector: @selector(uu__transitionCoordinator)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_transitionIsCompleting") alteredSelector: @selector(uu__transitionIsCompleting)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_transitionIsInFlight") alteredSelector: @selector(uu__transitionIsInFlight)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_updateInteractiveTransitionWithoutTrackingPercentComplete:") alteredSelector: @selector(uu__updateInteractiveTransitionWithoutTrackingPercentComplete:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"cancelInteractiveTransition") alteredSelector: @selector(uu_cancelInteractiveTransition)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"completeTransition:") alteredSelector: @selector(uu_completeTransition:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"containerView") alteredSelector: @selector(uu_containerView)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"dealloc") alteredSelector: @selector(uu_dealloc)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"finishInteractiveTransition") alteredSelector: @selector(uu_finishInteractiveTransition)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"init") alteredSelector: @selector(uu_init)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"initiallyInteractive") alteredSelector: @selector(uu_initiallyInteractive)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"isAnimated") alteredSelector: @selector(uu_isAnimated)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"isCurrentlyInteractive") alteredSelector: @selector(uu_isCurrentlyInteractive)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"isInteractive") alteredSelector: @selector(uu_isInteractive)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"isInterruptible") alteredSelector: @selector(uu_isInterruptible)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"pauseInteractiveTransition") alteredSelector: @selector(uu_pauseInteractiveTransition)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"presentationStyle") alteredSelector: @selector(uu_presentationStyle)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"setTransitionWasCancelled:") alteredSelector: @selector(uu_setTransitionWasCancelled:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"transitionWasCancelled") alteredSelector: @selector(uu_transitionWasCancelled)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"updateInteractiveTransition:") alteredSelector: @selector(uu_updateInteractiveTransition:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"viewControllerForKey:") alteredSelector: @selector(uu_viewControllerForKey:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"viewForKey:") alteredSelector: @selector(uu_viewForKey:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_fromView") alteredSelector: @selector(uu__fromView)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setFromView:") alteredSelector: @selector(uu__setFromView:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setFromViewController:") alteredSelector: @selector(uu__setFromViewController:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setToView:") alteredSelector: @selector(uu__setToView:)];
    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_setToViewController:") alteredSelector: @selector(uu__setToViewController:)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"_toView") alteredSelector: @selector(uu__toView)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"fromViewController") alteredSelector: @selector(uu_fromViewController)];
//    [self uu_swizzleClass:cls originalSelector:NSSelectorFromString(@"toViewController") alteredSelector: @selector(uu_toViewController)];
    class_addMethod(cls, @selector(uu_willCancel), method_getImplementation(class_getInstanceMethod(self, @selector(uu_willCancel))), method_getTypeEncoding(class_getInstanceMethod(self, @selector(uu_willCancel))));
    class_addMethod(cls, @selector(setUu_willCancel:), method_getImplementation(class_getInstanceMethod(self, @selector(setUu_willCancel:))), method_getTypeEncoding(class_getInstanceMethod(self, @selector(setUu_willCancel:))));
}

@end
