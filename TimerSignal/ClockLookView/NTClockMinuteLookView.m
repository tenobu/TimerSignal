//
//  NTClockMinuteLookView.m
//  TimerSignal
//
//  Created by ビザンコムマック０９ on 2014/09/03.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockMinuteLookView.h"

@interface NTClockMinuteLookView ()
{
	
@private
	
	NTClockGestureRecognizer *gestureRecognizer;
	
}

@end

@implementation NTClockMinuteLookView

- (id)initWithFrame: (CGRect)frame
{
    
	self = [super initWithFrame: frame];
	
    if ( self ) {
		
	}
    
	return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	// NSLog( @"minute : %@", NSStringFromCGRect( self.frame ));
	
	gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.frame
																target: self];
	
	[self addGestureRecognizer: gestureRecognizer];
	
	
}

- (void)time: (NSInteger)_minute
{
	
	self.integer_Minute = _minute;
	
	self.imageAngle = self.integer_Minute * 6;
	
	self.transform = CGAffineTransformMakeRotation( self.imageAngle *  M_PI / 180 );
	
	[self.clockRecognizer integerMinute: self.integer_Minute];
	
}

- (void) rotation: (CGFloat) angle
{
    
    /*self.imageAngle += angle;
	
	if ( self.imageAngle > 360 ) {
		
		self.imageAngle -= 360;
		
	} else if ( self.imageAngle < 0 ) {
		
		self.imageAngle += 360;
		
	}
	
	self.transform = CGAffineTransformMakeRotation( self.imageAngle *  M_PI / 180 );
	
	self.integer_Minute = self.imageAngle / 6;
	
	[self.clockRecognizer integerMinute: self.integer_Minute];*/
	
}

@end
