//
//  ViewController.m
//  WSYSplashView
//
//  Created by 袁仕崇 on 10/25/14.
//  Copyright (c) 2014 wilson. All rights reserved.
//

#import "ViewController.h"
#import "WSYSplashViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIImageView *backGroundImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    _backGroundImage = [UIImageView new];
    [_backGroundImage setImage:[UIImage imageNamed:@"IMG_1859"]];
    _backGroundImage.contentMode = UIViewContentModeScaleAspectFill;
    [_backGroundImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_backGroundImage];

    NSDictionary *views = NSDictionaryOfVariableBindings(_backGroundImage);
    NSString *viewKeys = [views.allKeys firstObject];
    NSString *backGroundImageConstraint = [NSString stringWithFormat:@"|-0-[%@]-0-|", viewKeys];
    NSString *viConstraint = [NSString stringWithFormat:@"V:|-0-[%@]-0-|",viewKeys];
    [_backGroundImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:backGroundImageConstraint options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:viConstraint options:0 metrics:nil views:views]];
    
    

    WSYSplashViewController *splashView = [[WSYSplashViewController alloc] initWithIconImage:[UIImage imageNamed:@"logo-60"] backGroundColor:nil backGroundImage:[UIImage imageNamed:@"IMG_1859"]];
    splashView.animationDuration = 1.0;
    [self.view addSubview:splashView];
    [splashView startAnimationWithCompletionHandler:^{
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
