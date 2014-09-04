
//
//  NTClockLookView.m
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/03.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockLookView.h"

@interface NTClockLookView ()
{
	
@private
	
	NTClockRecognizer *clockRecognizer;
	
	NSString *string_Hour;
	NSString *string_Minute;

	NSTimer *timer_NowTime;
	
}

@end

@implementation NTClockLookView

+ (NTClockLookView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockLookView"
										  owner: nil
										options: nil] lastObject];
	
}

- (id) awakeAfterUsingCoder: (NSCoder *)aDecoder
{
	
    BOOL loadedFromSimpleVuew = ( [[self subviews] count] == 0 );
    
	if ( loadedFromSimpleVuew ) {
		
        NTClockLookView *clockLookView = [NTClockLookView loadInstanceOfViewFromNib];
		
        clockLookView.frame                  = self.frame;
        clockLookView.autoresizingMask       = self.autoresizingMask;
        clockLookView.alpha                  = self.alpha;
        clockLookView.userInteractionEnabled = self.userInteractionEnabled;
		
        return clockLookView;
		
    }
	
    return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	self.integer_AmPm = 1;
	self.integer_Hour = self.integer_Minute = 0;
	
	self.imageView_Hour.clockRecognizer.delegate   = (id)self;
	self.imageView_Minute.clockRecognizer.delegate = (id)self;
	
	self.string_AmPm = @"AM";
	self.string_HHMM = @"00:00";
	
	string_Hour   = @"00";
	string_Minute = @"00";
	
	clockRecognizer = [[NTClockRecognizer alloc] init];
	
	clockRecognizer.delegate = self;
	
	self.imageView_Hour.clockRecognizer   = clockRecognizer;
	self.imageView_Minute.clockRecognizer = clockRecognizer;
	
}


- (void)setDate_DateTime:(NSDate *)_date_datetime
{
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss"];
	
	NSString *string_datetime = [dateFormatter stringFromDate: _date_datetime];
	self.string_Date      = [string_datetime  substringToIndex  : 10];
	self.string_Time      = [string_datetime  substringFromIndex: 11];
	NSString *string_hout = [self.string_Time substringToIndex  :  2];
	
	NSInteger integer_hour = string_hout.integerValue;
	
	if ( 0 <= integer_hour && integer_hour <= 11 ) {
		
		self.string_AmPm = @"AM";
		self.integer_AmPm = 2;
		
	} else if ( 12 <= integer_hour && integer_hour <= 23 ) {
		
		self.string_AmPm = @"PM";
		self.integer_AmPm = 1;
		
		integer_hour -= 12;
		
	}
	
	string_Hour              = [NSString stringWithFormat: @"%02ld", integer_hour];
	self.integer_Hour        = string_Hour.integerValue;
	
	string_Minute            = [self.string_Time substringWithRange: NSMakeRange(3, 2)];
	self.integer_Minute      = string_Minute.integerValue;
	
	NSString *string_second  = [self.string_Time substringWithRange: NSMakeRange(6, 2)];
	NSInteger integer_second = string_second.integerValue;
	
	[self amPm_Action];
	
	[self.imageView_Hour   time: self.integer_Hour];
	[self.imageView_Minute time: self.integer_Minute];


	[self setNowTimer];
	
	[NSTimer scheduledTimerWithTimeInterval: 60 - integer_second
									 target: self
								   selector: @selector(setOldTimer)
								   userInfo: nil
									repeats: NO];

}

- (NSDate *)date_DateTime
{
	
	NSString *string_hhmm = self.string_HHMM;
	
	if ( [self.string_AmPm isEqualToString: @"PM"] ) {
		
		NSString *string_hh = [self.string_HHMM substringWithRange: NSMakeRange( 0, 2 )];
		NSInteger integer_hh = string_hh.integerValue;
		NSString *string_mm = [self.string_HHMM substringWithRange: NSMakeRange( 3, 2 )];
		
		integer_hh += 12;
		
		string_hhmm = [NSString stringWithFormat: @"%02ld:%@", integer_hh, string_mm];
		
	}
	
	NSString *string_date_time = [NSString stringWithFormat: @"%@ %@:00", self.string_Date, string_hhmm];

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss"];
	
	return [dateFormatter dateFromString: string_date_time];
	
}

- (void)setString_TimeNow:(NSString *)_time;
{
	
	self.string_AmPm    = [_time substringWithRange: NSMakeRange( 0, 2)];
	
	if ( [self.string_AmPm isEqualToString: @"AM"] ) {
		
		self.integer_AmPm = 2;
		
	} else if ( [self.string_AmPm isEqualToString: @"PM"] ) {
		
		self.integer_AmPm = 1;
		
	}
	
	string_Hour         = [_time substringWithRange: NSMakeRange( 3, 2)];
	self.integer_Hour   = string_Hour.integerValue;
	
	string_Minute       = [_time substringWithRange: NSMakeRange( 6, 2)];
	self.integer_Minute = string_Minute.integerValue;
	
	[self button_Action        : nil];
	[self.imageView_Hour   time: self.integer_Hour];
	[self.imageView_Minute time: self.integer_Minute];
	
}

- (NSString *)string_TimeNow
{
	
	return [NSString stringWithFormat: @"%@ %@:%@", self.string_AmPm, string_Hour, string_Minute];
	
}

- (void)setOldTimer
{
	
	[NSTimer scheduledTimerWithTimeInterval: 60 * 1
									 target: self
								   selector: @selector(setNowTimer)
								   userInfo: nil
									repeats: YES];

	[self setNowTimer];
	
}

- (void)setNowTimer
{
	
	NSDate *date_now = [NSDate new];
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss"];
	
	NSString *string_datetime = [dateFormatter stringFromDate: date_now];
	NSString *string_time = [string_datetime substringFromIndex: 11];
	NSString *string_hout = [string_time     substringToIndex  :  2];
	
	NSInteger integer_hour = string_hout.integerValue;
	
	if ( 0 <= integer_hour && integer_hour <= 11 ) {
		
		self.string_AmPm = @"AM";
		self.integer_AmPm = 2;
		
	} else if ( 12 <= integer_hour && integer_hour <= 23 ) {
		
		self.string_AmPm = @"PM";
		self.integer_AmPm = 1;
		
		integer_hour -= 12;
		
	}
	
	string_Hour              = [NSString stringWithFormat: @"%02ld", integer_hour];
	self.integer_Hour        = string_Hour.integerValue;
	
	string_Minute            = [string_time substringWithRange: NSMakeRange(3, 2)];
	self.integer_Minute      = string_Minute.integerValue;
	
	[self amPm_Action];
	
	[self.imageView_Hour   time: self.integer_Hour];
	[self.imageView_Minute time: self.integer_Minute];
	
}

- (IBAction)button_Action: (id)sender
{
	
	// [self amPm_Action];
	
}

- (void)amPm_Action
{
	
	if ( self.integer_AmPm == 1 ) {
		
		self.integer_AmPm = 2;
		
		self.string_AmPm = @"PM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_PM.png"];
		
		[self.button_AmPm setImage: image forState: UIControlStateNormal];
		
	} else if ( self.integer_AmPm == 2 ) {
		
		self.integer_AmPm = 1;
		
		self.string_AmPm = @"AM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_AM.png"];
		
		[self.button_AmPm setImage: image forState: UIControlStateNormal];
		
	}
	
	[self time];
	
}

- (void)integerHour: (NSInteger)_integer
{
	
	self.imageView_Hour.transform = CGAffineTransformMakeRotation( _integer *  M_PI / 180 );
	
}

- (void)integerMinute: (NSInteger)_integer
{
	
	self.imageView_Minute.transform = CGAffineTransformMakeRotation( _integer *  M_PI / 180 );
	
}

- (void)hour: (NSInteger)_integer
{
	
	// NSLog( @"Hour = %02ld", _integer );
	
	string_Hour = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)minute:(NSInteger)_integer
{
	
	// NSLog( @"Minute = %02ld", _integer );
	
	string_Minute = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)time
{
	
	_string_HHMM = [NSString stringWithFormat: @"%@:%@", string_Hour, string_Minute];
	
	self.string_Time = [NSString stringWithFormat: @"%@ %@:%@", self.string_AmPm, string_Hour, string_Minute];
	
	// NSLog( @"Time = %@", self.string_Time );
	
	if ( [self.delegate respondsToSelector: @selector(time:)] ) {
		
        [self.delegate time: self.string_StartEnd];
		
    }
	
}

@end
