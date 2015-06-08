//
//  JXDismissAnimation.h
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypeUpOut,
    AnimationTypeDownOut,
    AnimationTypeLeftOut,
    AnimationTypeRightOut,
} AnimationDismissType;

@interface JXDismissAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationDismissType type;

@end
