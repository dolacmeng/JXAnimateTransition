//
//  JXPresentAnimation.m
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "JXPresentAnimation.h"
#define marginLeft 20   //距离屏幕左（右）宽度
#define marginTop  60   //距离屏幕上（下）高度

@implementation JXPresentAnimation{
    UIView *_coverView; //黑色背景
}


#pragma mark - UIViewControllerAnimatedTransitioning

#pragma mark 转场动画执行时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.8f;
}

#pragma mark 实现具体动画
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    
    _coverView = [[UIView alloc] initWithFrame:containerView.frame];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    if (!_coverView)
        _coverView.alpha = 1;
    else
        _coverView.alpha = 0;
    [containerView addSubview:_coverView];

    
    //从transitionContext获取目标UIViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //设置toVC的初始frame
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect endFrame;
    
    //根据type设置动画类型（toVC最终的CGRect）
    switch (self.type) {
        case AnimationTypeUpIn:{
            endFrame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
        }break;
        case AnimationTypeDownIn:{
            endFrame = CGRectOffset(finalFrame, 0, -screenBounds.size.height);
        }break;
        case AnimationTypeRightIn:{
            endFrame = CGRectMake(screenBounds.size.width, marginTop, screenBounds.size.width-marginLeft*2,screenBounds.size.height-marginTop*2);
        }break;
        case AnimationTypeLeftIn:{
            endFrame = CGRectMake(-screenBounds.size.width, marginTop,screenBounds.size.width-marginLeft*2,screenBounds.size.height-marginTop*2);
        }break;
        default:
            break;
    }
    
    //添加toVC到containerView
    [containerView addSubview:toVC.view];
    
    //实现弹簧效果动画
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    toVC.view.frame = endFrame;
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = CGRectMake(marginLeft, marginTop, screenBounds.size.width-marginLeft*2, screenBounds.size.height-marginTop*2);
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
    
}
@end
