//
//  ViewController.m
//  Pop动画
//
//  Created by 苗建浩 on 2017/9/5.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"POP动画";
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 50, 50)];
    //    testView.center = self.view.center;
    testView.backgroundColor = [UIColor grayColor];
    self.testView = testView;
    [self.view addSubview:testView];
    
    
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anSpring.toValue = @(self.testView.center.y );
    anSpring.beginTime = CACurrentMediaTime() + 1.0;// 开始时间
    anSpring.springBounciness = 15.0f;
    [self.testView pop_addAnimation:anSpring forKey:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    springAnimation.springSpeed = 0;
    springAnimation.springBounciness = 20;
    if (self.testView.frame.size.width == 100) {
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    }else{
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    }
    [self.testView.layer pop_addAnimation:springAnimation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
