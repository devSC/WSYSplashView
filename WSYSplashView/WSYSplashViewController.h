//
//  WSYSplashViewController.h
//  WSYSplashView
//
//  Created by WILSON on 10/25/14.
//  Copyright (c) 2014 wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSYSplashViewController : UIView

/**
 *  animation duration
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *  init method
 *
 *  @param icon  icon
 *  @param color backGroundColor
 *  @param image backGroundImage
 *
 *  @return self
 */
- (instancetype)initWithIconImage: (UIImage *)icon backGroundColor: (UIColor *)color backGroundImage: (UIImage *)image;
/**
 *  call to start animation with completion handler
 */
- (void)startAnimationWithCompletionHandler: (void (^)())completionHandle;
@end
