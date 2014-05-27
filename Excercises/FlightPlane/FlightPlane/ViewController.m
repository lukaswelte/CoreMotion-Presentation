//
//  ViewController.m
//  FlightPlane
//
//  Created by Lukas Welte on 27.09.12.
//  Copyright (c) 2012 Lukas Welte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *flightPlaneView;

@end

@implementation ViewController

#warning HINT: Every UIView (UIImageView is a sublcass of UIView) have a transform property that is very useful for rotating and moving… Looking it up in the Reference will make this super easy :)

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
