//
//  NTViewController.m
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/08/22.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTViewController.h"

#import "ClockRotationGesture/NTClockView.h"
#import "ClockRotationGesture/NTClockString.h"

@interface NTViewController ()
{

@private
		
	NTClockString *clockString;
	
}

@end

@implementation NTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if ( ! self.view.subviews.count ) {
		
		UIView *subview = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass( [self class] )
														owner: nil
													  options: nil] [0];
		
		subview.frame = self.view.bounds;
		
		[self.view addSubview: subview];
		
		NSArray *array = [subview subviews];
		
		self.clock_StartTime   = [array objectAtIndex: 0];
		
		clockString = [[NTClockString alloc] init];
		
		clockString.delegate = self;
		
		self.clock_StartTime.clockString = clockString;
		
	}
	
	clockString = [[NTClockString alloc] init];
	
	clockString.delegate = self;
	
	self.clock_StartTime.clockString = clockString;
	
	[clockString setTimeString: @"AM 09:30"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
