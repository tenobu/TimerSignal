//
//  NTClockHourView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/29.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHourView.h"

@interface NTClockHourView ()
{
	
@private
	
	NTClockGestureRecognizer *gestureRecognizer;
	
}

@end

@implementation NTClockHourView

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
	
	// NSLog( @"hour : %@", NSStringFromCGRect( self.bounds ));
	
	gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.bounds
																target: self];

	[self addGestureRecognizer: gestureRecognizer];
	
}

- (void)time: (NSInteger)_hour
{
	
	self.integer_Hour = _hour;
	
	self.imageAngle = self.integer_Hour * 30;

	self.transform = CGAffineTransformMakeRotation( self.imageAngle *  M_PI / 180 );

	[self.clockRecognizer integerHour: self.integer_Hour];

}

- (void) rotation: (CGFloat) angle
{
    
    self.imageAngle += angle;
	
	if ( self.imageAngle > 360 ) {
		
		self.imageAngle -= 360;
		
	} else if ( self.imageAngle < 0 ) {
		
		self.imageAngle += 360;
		
	}
	
	self.transform = CGAffineTransformMakeRotation( self.imageAngle *  M_PI / 180 );
	
	self.integer_Hour = self.imageAngle / 30;
	
	[self.clockRecognizer integerHour: self.integer_Hour];
	
}

@end
