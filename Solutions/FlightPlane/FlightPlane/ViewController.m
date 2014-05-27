//
//  ViewController.m
//  FlightPlane
//
//  Created by Lukas Welte on 27.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *flightPlaneView;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CMAttitude *referenceAttitude;
@end

@implementation ViewController

#warning HINT: Every UIView (UIImageView is a sublcass of UIView) have a transform property that is very useful for rotating and moving… Looking it up in the Reference will make this super easy :)

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self.motionManager isDeviceMotionAvailable]) {
        [self.motionManager setDeviceMotionUpdateInterval:1.0/60.0];
        [self.motionManager startDeviceMotionUpdates];
    }
    [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)updateView {
    if (![self.motionManager isDeviceMotionActive]) {
        return;
    }
        if (!self.referenceAttitude && self.motionManager.deviceMotion) {
            [self calibrate:nil];
        }
        
        CMAttitude *attitude = self.motionManager.deviceMotion.attitude;
        [attitude multiplyByInverseOfAttitude:self.referenceAttitude];
        
        
        //Move Plane
        
        CGAffineTransform rotation = CGAffineTransformMakeRotation(attitude.roll);
        
        float height = attitude.pitch * self.view.bounds.size.height/2;
        
        CGAffineTransform translation = CGAffineTransformMakeTranslation(self.flightPlaneView.bounds.origin.x, height);
        
        self.flightPlaneView.transform = CGAffineTransformConcat(rotation, translation);
}

- (IBAction)calibrate:(id)sender {
    self.referenceAttitude = self.motionManager.deviceMotion.attitude;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
