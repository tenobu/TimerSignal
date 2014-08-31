//
//  NTClockView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockView.h"

@interface NTClockView ()
{
	
@private
	
	NTClockRecognizer *clockRecognizer;
	
	NSString *string_Hour;
	NSString *string_Minute;
	
}

@end

@implementation NTClockView

+ (NTClockView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockView"
										  owner: nil
										options: nil] lastObject];
	
}

- (id) awakeAfterUsingCoder: (NSCoder *)aDecoder
{
	
    BOOL loadedFromSimpleVuew = ( [[self subviews] count] == 0 );
    
	if ( loadedFromSimpleVuew ) {
		
        NTClockView *clockView = [NTClockView loadInstanceOfViewFromNib];
		
        clockView.frame                  = self.frame;
        clockView.autoresizingMask       = self.autoresizingMask;
        clockView.alpha                  = self.alpha;
        clockView.userInteractionEnabled = self.userInteractionEnabled;
		
        return clockView;
		
    }
	
    return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	self.integer_AmPm = 1;
	self.integer_Hour = self.integer_Minute = 0;
	
	//self.hour_ImageView.clockRecognizer.delegate   = (id)self;
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

- (IBAction)button_Action: (id)sender
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
