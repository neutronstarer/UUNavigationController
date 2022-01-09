//
//  UIViewController+UUPrivate.m
//  UUNavigationController
//
//  Created by neutronstarer on 2021/11/3.
//

#import <objc/runtime.h>

#import "UIViewController+UUPrivate.h"
#import "UUNavigationController+UU.h"

@implementation UIViewController (UUPrivate)

- (UUNavigationController *)uu_navigationController{
    UIViewController *parentViewController = self.parentViewController;
    UIViewController *navigationController = self.navigationController;
    UIViewController *tabBarController = self.tabBarController;
    if ([parentViewController isKindOfClass:UUNavigationController.class]){
        return (UUNavigationController*)parentViewController;
    }
    if (navigationController){
        return navigationController.uu_navigationController;
    }
    if (tabBarController){
        return tabBarController.uu_navigationController;
    }
    return parentViewController.uu_navigationController;
}

@end
