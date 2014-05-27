//
//  AppDelegate.h
//  Triangle
//
//  Created by Lukas Welte on 25.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CMMotionManager *motionManager;

@end
