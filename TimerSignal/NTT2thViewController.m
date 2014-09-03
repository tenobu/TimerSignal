//
//  NTT2thViewController.m
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/01.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTT2thViewController.h"

@interface NTT2thViewController ()

@end

@implementation NTT2thViewController

- (void)viewDidLoad
{
    
	[super viewDidLoad];
	
	self.clockView_Start.delegate = (id)self;
	self.clockView_End.delegate   = (id)self;
	
	self.clockView_Start.string_StartEnd = @"Start";
	self.clockView_End.string_StartEnd   = @"End";
	
    //NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	self.clockView_Start.date_DateTime = [NSDate new];	
	self.clockView_End.date_DateTime   = [NSDate dateWithTimeIntervalSinceNow: 5 * 60 * 60];
	
	//app.string_StartTime = self.clockView_Start.string_TimeNow = @"AM 09:30";
	//app.string_EndTime   = self.clockView_End.string_TimeNow   = @"PM 04:00";
	
}

- (void)didReceiveMemoryWarning
{
	
    [super didReceiveMemoryWarning];
    
}

- (void)time: (NSString *)_startEnd
{
	
	// NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	if ( [_startEnd isEqualToString: @"Start"] ) {
		
		self.label_Start_AmPm.text = self.clockView_Start.string_AmPm;
		self.label_Start_HHMM.text = self.clockView_Start.string_HHMM;
		
		/*app.string_StartTime = [NSString stringWithFormat:
		 @"%@ %@", self.clockView_Start.string_AmPm, self.clockView_Start.string_HHMM];*/
		
	} else if ( [_startEnd isEqualToString: @"End"] ) {
		
		self.label_End_AmPm.text = self.clockView_End.string_AmPm;
		self.label_End_HHMM.text = self.clockView_End.string_HHMM;
		
		/*app.string_EndTime = [NSString stringWithFormat:
		 @"%@ %@", self.clockView_End.string_AmPm, self.clockView_End.string_HHMM];*/
		
	}
	
}

@end
