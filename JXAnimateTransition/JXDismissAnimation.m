//
//  JXDismissAnimation.m
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "JXDismissAnimation.h"
#define marginLeft 20
#define marginTop 60

@implementation JXDismissAnimation

#pragma mark 转场动画执行时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

#pragma mark 实现具体动画
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //从transitionContext获取目标UIViewController
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //fromVC的初始frame
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect endFrame;

    //根据type设置动画类型（formVC最终的CGRect）
    switch (self.type) {
        case AnimationTypeUpOut:{
            endFrame = CGRectOffset(initFrame, 0, -screenBounds.size.height);
        }break;
        case AnimationTypeDownOut:
            endFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
            break;
        case AnimationTypeLeftOut:
            endFrame = CGRectMake(-screenBounds.size.width, marginTop, screenBounds.size.width-marginLeft*2, screenBounds.size.height-marginTop*2);
            break;
        case AnimationTypeRightOut:
            endFrame = CGRectMake(screenBounds.size.width, marginTop, screenBounds.size.width-marginLeft*2, screenBounds.size.height-marginTop*2);
            break;
        default:
            break;
    }
    
    //实现动画效果
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{fromVC.view.frame = endFrame;}
                     completion:^(BOOL finished){[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
