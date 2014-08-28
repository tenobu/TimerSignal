//
//  NTClockView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockView.h"

#import "NTClockAmPmView.h"
#import "NTClockHourView.h"
#import "NTClockMinuteView.h"
#import "NTClockRecognizer.h"
#import "NTClockString.h"

@interface NTClockView ()
{
	
@private
	
	//NTClockRecognizer *clockRecognizer;
		
	NSString *stringAmPm;
	NSString *stringHour;
	NSString *stringMinute;

}

@end

@implementation NTClockView

/*- (id)initWithFrame: (CGRect)frame
{
    
	self = [super initWithFrame: frame];
	
    if (self) {
		
	}
    
	return self;
	
}

- (id)initWithCoder: (NSCoder *)decoder
{
    
	self = [super initWithCoder: decoder];
	
	if (self) {
		
		if ( ! self.subviews.count ) {
            
			UIView *subview = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass( [self class] )
															owner: nil
														  options: nil] [0];
            
			subview.frame = self.bounds;
            
			[self addSubview: subview];
			
			NSArray *array = [subview subviews];
			
			self.amPmView   = [array objectAtIndex: 1];
			self.minuteView = [array objectAtIndex: 2];
			self.hourView   = [array objectAtIndex: 3];
			
		}
		
	}
	
	return self;
	
}*/

+ (NTClockView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockView"
										  owner: nil
										options: nil] lastObject];
	
}

// オーバーライド
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
		
	//clockRecognizer.delegate = self;
	
 	self.amPm_ClockRecognizer = self.amPmView.clockRecognizer;
	self.amPm_ClockRecognizer.delegate = self;
	
	//self.minuteView.clockRecognizer = clockRecognizer;
	//self.hourView.clockRecognizer   = clockRecognizer;
	
	stringAmPm = @"AM";
	
}

- (void)amPm: (NSInteger)_integer
{

	NSLog( @"AmPm = %02ld", _integer );
	
	/*if ( _integer == 1 ) {
		
		stringAmPm = @"AM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_AM.png"];
		
		[self.buttonAmPm setImage: image forState: UIControlStateNormal];
		
	} else if ( _integer == 2 ) {
		
		stringAmPm = @"PM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_PM.png"];
		
		[self.buttonAmPm setImage: image forState: UIControlStateNormal];
		
	}*/

	[self time];
	
}

- (void)hour: (NSInteger)_integer
{
	
	// NSLog( @"Hour = %02ld", _integer );
	
	stringHour = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)minute:(NSInteger)_integer
{
	
	// NSLog( @"Minute = %02ld", _integer );
	
	stringMinute = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)time
{
	
	self.stringTime = [NSString stringWithFormat: @"%@ %@:%@", stringAmPm, stringHour, stringMinute];

	NSLog( @"Time = %@", self.stringTime );
	
	[self.clockString time: self.stringTime];
	
}

- (IBAction)button_Action:(id)sender
{

	/*if ( _integer == 1 ) {
		
		_integer = 2;
		
		stringAmPm = @"AM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_PM.png"];
		
		[self.buttonAmPm setImage: image forState: UIControlStateNormal];
		
	} else if ( _integer == 2 ) {
		
		_integer = 1;
		
		stringAmPm = @"PM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_AM.png"];
		
		[self.buttonAmPm setImage: image forState: UIControlStateNormal];
		
	}*/

	[self.amPmView.clockRecognizer on];
	
}

@end
