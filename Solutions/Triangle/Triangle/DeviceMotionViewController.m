//
//  DeviceMotionViewController.m
//  Triangle
//
//  Created by Lukas Welte on 25.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import "DeviceMotionViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface DeviceMotionViewController () {
    float turnDegrees;
    NSTimer *timer;
}
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation DeviceMotionViewController
//Function to convert Radians to Degrees
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
#warning Task 1: Configure CMMotionManager for Device Motion and start updates
- (void)configureCoreMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    if ([self.motionManager isDeviceMotionAvailable]) {
        [self.motionManager setDeviceMotionUpdateInterval:1/60];
        [self.motionManager startDeviceMotionUpdates];
    }
}

//
//Your Task
#warning Task 2: Calculate the turn degrees (hint: think about what attitude provides you) and display it via -(void)displayTurnInDegrees:(float)degrees
- (void)updateValues {
    //Calculate the turnDegrees
    CMAttitude *attitude = self.motionManager.deviceMotion.attitude;
    turnDegrees = RADIANS_TO_DEGREES(attitude.yaw);
    
    //Display turnDegrees via -(void)displayTurnInDegrees:(float)degrees
    [self displayTurnInDegrees:turnDegrees];
}

//Function to display degrees on the view
- (void)displayTurnInDegrees:(float) degrees {
    [self.degreeLabel setText:[NSString stringWithFormat:@"%.2f",degrees]];
}

- (void)viewWillAppear:(BOOL)animated {
    turnDegrees = 0.0f;
    [self configureCoreMotionManager];
    timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(updateValues) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.motionManager stopDeviceMotionUpdates];
    self.motionManager = nil;
    [timer invalidate];
    timer = nil;
}
@end
