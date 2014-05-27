//
//  ViewController.m
//  Shaker
//
//  Created by Lukas Welte on 25.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import "ViewController.h"
//Import necessary for vibrate
#import <AudioToolbox/AudioToolbox.h>

#import <CoreMotion/CoreMotion.h>


@interface ViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation ViewController
#define THRESHOLD 2.0

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureCoreMotionManagerAndStartAccelerometerUpdates];
    [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(checkAccelerometer) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//Your Task
#warning Task1: Configure CMMotionManager and start AccelerometerUpdates
- (void)configureCoreMotionManagerAndStartAccelerometerUpdates {
    self.motionManager = [[CMMotionManager alloc] init];
    if ([self.motionManager isAccelerometerAvailable]) {
        [self.motionManager setAccelerometerUpdateInterval:1/60];
        [self.motionManager startAccelerometerUpdates];
    }
}

//
//Your Task
//Check for accelerations bigger than the THRESHOLD
#warning Task2: Check if Accelerometer Acceleration on an axis is bigger than the treshold, then let the Device vibrate
- (void)checkAccelerometer {
    CMAcceleration acceleration = self.motionManager.accelerometerData.acceleration;
    if (acceleration.x > THRESHOLD || acceleration.y > THRESHOLD || acceleration.z > THRESHOLD) {
        [self playVibrateSound];
    }
}

//Method let's the device vibrate
- (void)playVibrateSound {
     AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
