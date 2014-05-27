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



@interface ViewController ()

@end

@implementation ViewController
#define THRESHOLD 2.0

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
//Your Task
#warning Task1: Configure CMMotionManager and start AccelerometerUpdates


//
//Your Task
//Check for accelerations bigger than the THRESHOLD
#warning Task2: Check if Accelerometer Acceleration on an axis is bigger than the treshold, then let the Device vibrate


//Method let's the device vibrate
- (void)playVibrateSound {
     AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
