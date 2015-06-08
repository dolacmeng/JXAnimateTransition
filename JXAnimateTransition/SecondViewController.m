//
//  SecondViewController.m
//  JXAnimateTransition
//
//  Created by JackXu on 15/6/8.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [self randomColor];
    self.view.layer.cornerRadius = 6;
    self.view.layer.masksToBounds = YES;
    
    UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-50)/2-20,(self.view.frame.size.height-22)/2-100, 50, 22)];
    [btnClose setTitle:@"Close" forState:UIControlStateNormal];
    [btnClose setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnClose setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btnClose addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
    
    UIButton *btnNext = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-50)/2-20,(self.view.frame.size.height-22)/2-60, 50, 22)];
    [btnNext setTitle:@"Add" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btnNext addTarget:self action:@selector(showNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showNext{
    SecondViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    svc.transitioningDelegate = _mainVC;
    svc.modalPresentationStyle = UIModalPresentationCustom;
    svc.mainVC = _mainVC;
    [self presentViewController:svc animated:YES completion:nil];
}

-(UIColor *) randomColor
{
    CGFloat red = ( arc4random() % 256 / 256.0 );
    CGFloat green = ( arc4random() % 256 / 256.0 ) + 0.5;
    CGFloat blue = ( arc4random() % 256 / 256.0 ) + 0.5;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}


@end
