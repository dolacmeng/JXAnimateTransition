//
//  ViewController.m
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "ViewController.h"
#import "JXDismissAnimation.h"
#import "JXPresentAnimation.h"
#import "JXInteractiveTransition.h"
#import "SecondViewController.h"

@interface ViewController ()

@property(nonatomic,strong)JXPresentAnimation *presentAnimation;
@property(nonatomic,strong)JXDismissAnimation *dismissAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    UIButton *btnNext = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    btnNext.center = self.view.center;
    [btnNext setTitle:@"Add" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNext addTarget:self action:@selector(showNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
    
    _presentAnimation = [[JXPresentAnimation alloc] init];
    _dismissAnimation = [[JXDismissAnimation alloc] init];
}

-(void)showNext{
    SecondViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    svc.transitioningDelegate = self;
    svc.modalPresentationStyle = UIModalPresentationCustom;
    svc.mainVC = self;
    [self presentViewController:svc animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    switch (arc4random() % 4) {
        case 0:
            _presentAnimation.type = AnimationTypeUpIn;break;
        case 1:
            _presentAnimation.type = AnimationTypeDownIn;break;
        case 2:
            _presentAnimation.type = AnimationTypeLeftIn;break;
        case 3:
            _presentAnimation.type = AnimationTypeRightIn;break;
        default:
            break;
    }
    return _presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    switch (arc4random() % 4) {
        case 0:
            _dismissAnimation.type = AnimationTypeDownOut;break;
        case 1:
            _dismissAnimation.type = AnimationTypeUpOut;break;
        case 2:
            _dismissAnimation.type = AnimationTypeLeftOut;break;
        case 3:
            _dismissAnimation.type = AnimationTypeRightOut;break;
        default:
            break;
    }

    return _dismissAnimation;
}

//-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    return self.transitionController;
//}
@end
