//
//  WSYSplashViewController.m
//  WSYSplashView
//
//  Created by 袁仕崇 on 10/25/14.
//  Copyright (c) 2014 wilson. All rights reserved.
//

#import "WSYSplashViewController.h"

@interface WSYSplashViewController ()

@property (strong, nonatomic) UIImageView *logoImageView;
@property (strong, nonatomic) UIImageView *backGroundImageView;

@end

@implementation WSYSplashViewController

- (instancetype)initWithIconImage:(UIImage *)icon backGroundColor:(UIColor *)color backGroundImage:(UIImage *)image
{
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    if (self) {
        if (image) {
            _backGroundImageView = [UIImageView new];
            [_backGroundImageView setImage:image];
            _backGroundImageView.contentMode = UIViewContentModeScaleAspectFill;
            [_backGroundImageView setFrame:[UIScreen mainScreen].bounds];
            [self addSubview:_backGroundImageView];
        }
        
        NSLog(@"%@", NSStringFromCGSize(icon.size));
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, icon.size.width, icon.size.height)];
        _logoImageView.center = self.center;
        _logoImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_logoImageView setImage:icon];
        [self addSubview:_logoImageView];
        
        
    }
    
    return self;
}

-(void)startAnimationWithCompletionHandler:(void (^)())completionHandle
{
    if (!_animationDuration) {
        return;
    }
    CGFloat shrinkAnimation = _animationDuration * 0.7;
    CGFloat growAnimation = _animationDuration * 0.3;
    [UIView animateWithDuration:shrinkAnimation delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        /* 缩小比例倍数 */
        CGAffineTransform transform = CGAffineTransformMakeScale(0.85, 0.85);
        _logoImageView.transform = transform;
        
        
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:growAnimation animations:^{
                CGAffineTransform growTransform = CGAffineTransformMakeScale(20, 20);
                _logoImageView.transform = growTransform;
                self.alpha = 0;
                
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
                completionHandle();
            }];
        }
    }];
    
    if (_backGroundImageView) {
        [UIView animateWithDuration:_animationDuration animations:^{
            CGAffineTransform backGroundImageTransform = CGAffineTransformMakeScale(1.1, 1.1);
            _backGroundImageView.transform = backGroundImageTransform;
        } completion:^(BOOL finished) {
            
        }];
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
