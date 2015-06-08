//
//  JXPresentAnimation.h
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypeDownIn,
    AnimationTypeUpIn,
    AnimationTypeLeftIn,
    AnimationTypeRightIn
} AnimationToType;

@interface JXPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) AnimationToType type;

@end
