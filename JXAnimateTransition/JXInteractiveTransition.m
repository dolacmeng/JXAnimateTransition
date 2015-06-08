//
//  JXInteractiveTransition.m
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "JXInteractiveTransition.h"

@interface JXInteractiveTransition()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *presentingVC;

@end

@implementation JXInteractiveTransition

-(void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint tranlation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            //标记interacting
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
        }break;
        case UIGestureRecognizerStateChanged:{
            //计算滑动的百分比
            CGFloat fraction = tranlation.y/400;
            //限制在0-1之间（小于0取0，大于1取1）
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            //手势距离超过一半
            self.shouldComplete = (fraction > 0.5);
            [self updateInteractiveTransition:fraction];
        }break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            //结束手势,判断取消还是进行切换
            self.interacting = NO;
            if (!self.shouldComplete||gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
        }break;
        default:
            break;
    }
}

@end