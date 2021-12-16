@import UIKit;

@interface UU__UIViewControllerOneToOneTransitionContext: NSObject
    

@property (nonatomic, copy) void(^uu_willCancel)(void);

-(id)uu__fromView;
        
    
-(void)uu__setFromView:(id)arg1 ;
        
    
-(void)uu__setFromViewController:(id)arg1 ;
        
    
-(void)uu__setToView:(id)arg1 ;
        
    
-(void)uu__setToViewController:(id)arg1 ;
        
    
-(id)uu__toView;
        
    
-(void)uu_dealloc;
        
    
-(id)uu_fromViewController;
        
    
-(id)uu_toViewController;
        
    
-(id)uu_viewControllerForKey:(id)arg1 ;
        
    
-(id)uu_viewForKey:(id)arg1 ;
        
-(void)uu___runAlongsideAnimations;
        
    
-(bool)uu__allowUserInteraction;
        
    
-(long long)uu__alongsideAnimationsCount;
        
    
-(id)uu__animator;
        
    
-(id)uu__auxContext;
        
    
-(long long)uu__completionCurve;
        
    
-(double)uu__completionVelocity;
        
    
-(id)uu__containerViews;
        
    
-(void)uu__disableInteractionForViews:(id)arg1 ;
        
    
-(double)uu__duration;
        
    
-(void)uu__enableInteractionForDisabledViews;
        
    
-(bool)uu__initiallyInteractive;
        
    
-(void)uu__interactivityDidChange:(bool)arg1 ;
        
    
-(id)uu__interactor;
        
    
-(bool)uu__isPresentation;
        
    
-(bool)uu__isRotating;
        
    
-(double)uu__percentOffset;
        
    
-(double)uu__previousPercentComplete;
        
    
-(void)uu__runAlongsideCompletions;
        
    
-(void)uu__setAllowUserInteraction:(bool)arg1 ;
        
    
-(void)uu__setAnimator:(id)arg1 ;
        
    
-(void)uu__setAuxContext:(id)arg1 ;
        
    
-(void)uu__setCompletionCurve:(long long)arg1 ;
        
    
-(void)uu__setCompletionHandler:(id)arg1 ;
        
    
-(void)uu__setCompletionVelocity:(double)arg1 ;
        
    
-(void)uu__setContainerView:(id)arg1 ;
        
    
-(void)uu__setContainerViews:(id)arg1 ;
        
    
-(void)uu__setCurrentlyInteractive:(bool)arg1 ;
        
    
-(void)uu__setDidCompleteHandler:(id)arg1 ;
        
    
-(void)uu__setDuration:(double)arg1 ;
        
    
-(void)uu__setInitiallyInteractive:(bool)arg1 ;
        
    
-(void)uu__setInteractiveUpdateHandler:(id)arg1 ;
        
    
-(void)uu__setInteractor:(id)arg1 ;
        
    
-(void)uu__setInterruptible:(bool)arg1 ;
        
    
-(void)uu__setIsAnimated:(bool)arg1 ;
        
    
-(void)uu__setIsPresentation:(bool)arg1 ;
        
    
-(void)uu__setPercentOffset:(double)arg1 ;
        
    
-(void)uu__setPostInteractiveCompletionHandler:(id)arg1 ;
        
    
-(void)uu__setPresentationStyle:(long long)arg1 ;
        
    
-(void)uu__setPreviousPercentComplete:(double)arg1 ;
        
    
-(void)uu__setRotating:(bool)arg1 ;
        
    
-(void)uu__setState:(long long)arg1 ;
        
    
-(void)uu__setTransitionIsCompleting:(bool)arg1 ;
        
    
-(void)uu__setTransitionIsInFlight:(bool)arg1 ;
        
    
-(void)uu__setWillCompleteHandler:(id)arg1 ;
        
    
-(long long)uu__state;
        
    
-(void)uu__stopInteractiveTransition;
        
    
-(id)uu__transitionCoordinator;
        
    
-(bool)uu__transitionIsCompleting;
        
    
-(bool)uu__transitionIsInFlight;
        
    
-(void)uu__updateInteractiveTransitionWithoutTrackingPercentComplete:(double)arg1 ;
        
    
-(void)uu_cancelInteractiveTransition;
        
    
-(void)uu_completeTransition:(bool)arg1 ;
        
    
-(id)uu_containerView;
    

-(void)uu_finishInteractiveTransition;

    
-(id)uu_init;
        
    
-(bool)uu_initiallyInteractive;
        
    
-(bool)uu_isAnimated;
        
    
-(bool)uu_isCurrentlyInteractive;
        
    
-(bool)uu_isInteractive;
        
    
-(bool)uu_isInterruptible;
        
    
-(void)uu_pauseInteractiveTransition;
        
    
-(long long)uu_presentationStyle;
        
    
-(void)uu_setTransitionWasCancelled:(bool)arg1 ;
        
    
-(bool)uu_transitionWasCancelled;
        
    
-(void)uu_updateInteractiveTransition:(double)arg1 ;
        
    

@end
