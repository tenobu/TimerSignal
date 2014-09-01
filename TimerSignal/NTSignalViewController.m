//
//  NTSignalViewController.m
//  TimeSignal
//
//  Created by ビザンコムマック０９ on 2014/07/10.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTSignalViewController.h"

#import "NTAppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface NTSignalViewController ()
{

@private
	
    NSString *string_Start, *string_End;

    NSDate *date_Now, *date_Start, *date_Stop;

	
	NSDateFormatter *dateFormatter, *timeFormatter;
	
	NSTimer *timer_Defalt;
	NSString *string_DefaltDate, *string_DefaltTime;
	NSString *string_StartTime, *string_StopTime;
	
	NSInteger integer_TimeResult;
	BOOL bool_AudioResult;
	
	NSCalendar *calendar;
	
	NSInteger integer_NowHour, integer_NowMinute, integer_NowSecond;
	
	AVSpeechSynthesizer *speechSynthesizer;

	NSInteger timeZone;
	
	//NSTimer *timer_Start, *timer;
	
}

@end

@implementation NTSignalViewController

// 音声の表示形態
const enum _time {
	
	time_Hour     = 0x1000000,
	time_HalfHour = 0x0100000,
	time_10Minute = 0x0010000,
	time_5Minute  = 0x0001000,
	time_Minute   = 0x0000100,
	time_30Second = 0x0000010,
	time_Second   = 0x0000001
	
} _time;

//
const enum _timeResult {
	
	timeResult_Mae  = 0x001,
	timeResult_Just = 0x010,
	timeResult_Ato  = 0x100
	
} _timeResult;

- (id)initWithNibName: (NSString *)nibNameOrNil
			   bundle: (NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName: nibNameOrNil
						   bundle: nibBundleOrNil];
    
    if (self) {
    
    }
    
    return self;

}

- (void)viewDidLoad
{

    [super viewDidLoad];

    NTAppDelegate *app = [[UIApplication sharedApplication] delegate];
	
    string_Start = app.string_StartTime24;
    string_End   = app.string_EndTime24;
	
 	dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss"];
	
 	timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat: @"HH:mm:ss"];
	
	
	
	
	
	
	
	date_Start = [dateFormatter dateFromString: string_Start];
	string_StartTime = [timeFormatter stringFromDate: date_Start];

	date_Stop  = [dateFormatter dateFromString: string_End];
	string_StopTime = [timeFormatter stringFromDate: date_Stop];

	// integer_TimeResultの初期値
	integer_TimeResult = timeResult_Mae;
	
	// bool_AudioResultの初期値
	bool_AudioResult = NO;
	
	[_startLabel setText: string_StartTime];
	[_timeLabel  setText: string_StartTime];
	[_stopLabel  setText: string_StopTime];
	
	calendar = [NSCalendar currentCalendar];

//  音声の初期化
	speechSynthesizer = [[AVSpeechSynthesizer alloc] init];

//  表示形態の初期化
	timeZone = time_Hour | time_HalfHour | time_10Minute | time_5Minute;
	
	timer_Defalt = [NSTimer scheduledTimerWithTimeInterval: 1.0f
												   target: self
												 selector: @selector(onTimer_Defalt:)
												 userInfo: nil
												  repeats: YES];

}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];

}

- (void)onTimer_Defalt: (NSTimer *)_timer
{
	
	// 今の時間を受け取る
    date_Now = [NSDate date];
    
    string_DefaltDate = [dateFormatter stringFromDate: date_Now];
    string_DefaltTime = [timeFormatter stringFromDate: date_Now];

	NSComparisonResult result = [date_Now compare: date_Start];
	
	switch( result ) {
			
		case NSOrderedAscending:

			integer_TimeResult  = timeResult_Mae;
			bool_AudioResult = NO;
			
			[_startLabel setText: string_DefaltTime];
			
			break;

		case NSOrderedSame:

			integer_TimeResult  = timeResult_Just;
			bool_AudioResult = YES;
			
			[_startLabel setText: string_StartTime];
			[_timeLabel  setText: string_DefaltTime];
			
			break;
			
		case NSOrderedDescending:

			integer_TimeResult  = timeResult_Ato;
			bool_AudioResult = YES;
			
			[_startLabel setText: string_StartTime];
			[_timeLabel  setText: string_DefaltTime];

			break;
	
	}
	
	bool_AudioResult = NO;
	
	if ( integer_TimeResult == timeResult_Just ||
		 integer_TimeResult == timeResult_Ato    ) {

		// 残り時間の計算
		NSTimeInterval nokori_keisan = [date_Stop timeIntervalSinceDate: date_Now];
		
		NSInteger nokori = nokori_keisan;
		NSInteger nokori_hour   = nokori / ( 60 * 60 );
		NSInteger nokori_minute = ( nokori - ( nokori_hour * 60 * 60 )) / 60;
		NSInteger nokori_second = nokori - ( nokori_hour * 60 * 60 ) - ( nokori_minute * 60 );
		/*
		NSString *stop_str  = [timeFormatter stringFromDate: date_Stop];
		NSString *start_str = [timeFormatter stringFromDate: date_Start];

		NSLog( @"%@ - %@ = %ld", stop_str, start_str, nokori );
		NSLog( @"hour %ld minute %ld second %ld", nokori_hour, nokori_minute, nokori_second );
		*/
		NSDateComponents *dateComps = [calendar components:
									   NSYearCalendarUnit   | NSMonthCalendarUnit  |
									   NSDayCalendarUnit    | NSHourCalendarUnit   |
									   NSMinuteCalendarUnit | NSSecondCalendarUnit
												  fromDate: date_Now];
		
		// 時分秒の各数値化
		integer_NowHour   = dateComps.hour;
		integer_NowMinute = dateComps.minute;
		integer_NowSecond = dateComps.second;

		NSString *str;

		if ( nokori_hour > 0 ) {

			if (( integer_NowMinute ==  0 || integer_NowMinute == 15 ||
				  integer_NowMinute == 30 || integer_NowMinute == 45    ) &&
				( integer_NowSecond ==  0                       )    ) {

				// 音声の組み立て
				str = [NSString stringWithFormat:
					   @"%ld時%ld分%ld秒です", integer_NowHour, integer_NowMinute, integer_NowSecond];
				
				bool_AudioResult = YES;
				
			}
			
		} else if ( nokori_hour == 0 && nokori_minute > 0 ) {
			
			if (( integer_NowMinute ==  0 || integer_NowMinute ==  5 ||
				  integer_NowMinute == 10 || integer_NowMinute == 15 ||
				  integer_NowMinute == 20 || integer_NowMinute == 25 ||
				  integer_NowMinute == 30 || integer_NowMinute == 35 ||
 				  integer_NowMinute == 40 || integer_NowMinute == 45 ||
				  integer_NowMinute == 50 || integer_NowMinute == 55    ) &&
				( integer_NowSecond ==  0                       )    ) {
				
				// 音声の組み立て
				str = [NSString stringWithFormat:
					   @"%ld時%ld分%ld秒です", integer_NowHour, integer_NowMinute, integer_NowSecond];
				
				bool_AudioResult = YES;
				
			}
			
		} else if ( nokori_hour == 0 && nokori_minute == 0 && nokori_second > 10 ) {
			
			if ( integer_NowSecond ==  0 || integer_NowSecond ==  5 ||
				 integer_NowSecond == 10 || integer_NowSecond == 15 ||
				 integer_NowSecond == 20 || integer_NowSecond == 25 ||
				 integer_NowSecond == 30 || integer_NowSecond == 35 ||
				 integer_NowSecond == 40 || integer_NowSecond == 45 ||
				 integer_NowSecond == 50 || integer_NowSecond == 55    ) {
				
				// 音声の組み立て
				str = [NSString stringWithFormat: @"%ld時%ld分%ld秒です", integer_NowHour, integer_NowMinute, integer_NowSecond];
				
				bool_AudioResult = YES;
				
			}
			
		} else if ( nokori_hour == 0 && nokori_minute == 0 && nokori_second >= 5 ) {

			if ( nokori_second == 10 || nokori_second == 5 ) {
				
				// 音声の組み立て
				str = [NSString stringWithFormat: @"%ld秒前", nokori_second];
				
				bool_AudioResult = YES;
				
			}
			
		} else if ( nokori_hour == 0 && nokori_minute == 0 && nokori_second > 0 ) {
			
			// 音声の組み立て
			str = [NSString stringWithFormat: @"%ld秒前", nokori_second];
			
			bool_AudioResult = YES;
						
		} else if ( nokori_hour == 0 && nokori_minute == 0 && nokori_second <= 0 ) {
			
			// 音声の組み立て
			str = [NSString stringWithFormat: @"時間です"];
			
			bool_AudioResult = YES;
			
			if ( nokori_second == 0 ) {
			
				// タイマーの停止
				[timer_Defalt invalidate];
				
			}
			
		} else {
			
			bool_AudioResult = NO;
			
		}
		
		if ( bool_AudioResult ) {
				
			// 音声合成
			AVSpeechUtterance      *utterance = [AVSpeechUtterance speechUtteranceWithString: str];
			AVSpeechSynthesisVoice *JVoice    = [AVSpeechSynthesisVoice voiceWithLanguage: @"ja-JP"];
		
			// 音声の日本語化
			utterance.voice =  JVoice;
					
			NSLog( @"%@", str );
			// NSLog( @"bool_AudioResult == %d", bool_AudioResult );
			
			// 音声の発生
			// [speechSynthesizer speakUtterance: utterance];
		
		}
		
	}
	
}

@end
