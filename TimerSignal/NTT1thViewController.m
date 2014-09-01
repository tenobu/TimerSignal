//
//  NTT1thViewController.m
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/01.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTT1thViewController.h"

@interface NTT1thViewController ()

@end

@implementation NTT1thViewController

- (void)viewDidLoad
{
    
	[super viewDidLoad];
	
	self.clockView_End.delegate   = (id)self;
	
	self.clockView_End.string_StartEnd   = @"End";
	
    //NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	self.clockView_End.date_DateTime   = [NSDate dateWithTimeIntervalSinceNow: 5 * 60 * 60];
	
	//app.string_EndTime   = self.clockView_End.string_TimeNow   = @"PM 04:00";
	
}

- (void)didReceiveMemoryWarning
{
	
    [super didReceiveMemoryWarning];
    
}

- (void)time: (NSString *)_startEnd
{
	
	// NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
	if ( [_startEnd isEqualToString: @"End"] ) {
		
		self.label_End_AmPm.text = self.clockView_End.string_AmPm;
		self.label_End_HHMM.text = self.clockView_End.string_HHMM;
		
		/*app.string_EndTime = [NSString stringWithFormat:
		 @"%@ %@", self.clockView_End.string_AmPm, self.clockView_End.string_HHMM];*/
		
	}
	
}

@end
