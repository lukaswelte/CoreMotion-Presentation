//
//  ViewController.m
//  Triangle
//
//  Created by Lukas Welte on 25.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController () {
    float turnDegrees;
    NSTimer *timer;
}
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation ViewController
//Function to convert Radians to Degrees
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

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
#warning Task 1: Configure CMMotionManager for the Gyro and start updates
- (void)configureCoreMotionManager {

}

//
//Your Task
#warning Task 2: Calculate the turn degrees from the rotation rate (radians per second) and display it via -(void)displayTurnInDegrees:(float)degrees
- (void)updateValues {
    //Calculate the turnDegrees (just try approaching it, you won't get the exact value)
    
    //Display turnDegrees via -(void)displayTurnInDegrees:(float)degrees
}


//Function to display degrees on the view
- (void)displayTurnInDegrees:(float) degrees {
    [self.degreeLabel setText:[NSString stringWithFormat:@"%f",degrees]];
}

- (void)viewWillAppear:(BOOL)animated {
    turnDegrees = 0.0f;
    [self configureCoreMotionManager];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(updateValues) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.motionManager stopGyroUpdates];
    self.motionManager = nil;
    [timer invalidate];
    timer = nil;
}
@end
