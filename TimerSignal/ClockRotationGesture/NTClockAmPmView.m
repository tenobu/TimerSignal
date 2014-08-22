//
//  NTClockAmPmView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/17.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockAmPmView.h"

@interface NTClockAmPmView ()
{
	
@private CGFloat imageAngle;
@private NTClockGestureRecognizer *gestureRecognizer;
	
}

@end

@implementation NTClockAmPmView

- (id)initWithCoder: (NSCoder *)decoder
{
    
	self = [super initWithCoder: decoder];
	
	if (self) {
		
		if ( ! self.subviews.count ) {
            
			// 
			UIView *subview = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass( [self class] )
															owner: nil
														  options: nil] [0];
            
			subview.frame = self.bounds;
            
			[self addSubview: subview];
			
			NSArray *array = [subview subviews];
			
			self.amPm_ImageView = [array objectAtIndex: 1];
			self.amPm_ImageView.frame = subview.frame;
			
			imageAngle = 0;
			
			gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.amPm_ImageView.frame
																		target: self];
			
			[self addGestureRecognizer: gestureRecognizer];
			
		}
		
	}
	
	return self;
	
}

- (void) rotation: (CGFloat) angle
{
    
    imageAngle += angle;
    
	if (imageAngle > 360) {
		
		imageAngle -= 360;
		
	} else if (imageAngle < -360) {
		
		imageAngle += 360;
		
	}
	
	if ( imageAngle < -25 ) {
		
		imageAngle = -25;
		
	} else if ( imageAngle > 27 ) {
		
		imageAngle = 27;
		
	}
	
    self.amPm_ImageView.transform = CGAffineTransformMakeRotation( imageAngle *  M_PI / 180 );

	if ( imageAngle >= -25 && imageAngle < -20 ) {
		
		self.integerAmPm = 2;
		
	} else if ( imageAngle <= 27 && imageAngle > 20 ) {
		
		self.integerAmPm = 1;
		
	} else {
		
		self.integerAmPm = 0;
		
	}
	
	if ( self.integerAmPm != 0 ) {
		
		[self.clockRecognizer amPm: self.integerAmPm];
		
	}
	
}

@end
