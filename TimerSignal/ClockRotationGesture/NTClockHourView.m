//
//  NTClockHourView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHourView.h"

@interface NTClockHourView ()
{
	
@private CGFloat imageAngle;
@private NTClockGestureRecognizer *gestureRecognizer;
	
}

@end
@implementation NTClockHourView

- (id)initWithFrame: (CGRect)frame
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
			
			self.hour_ImageView = [array objectAtIndex: 0];
			self.hour_ImageView.frame = subview.frame;
			
			imageAngle = 0;
			
			gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.hour_ImageView.frame
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
		
	} else if (imageAngle < 0) {
		
		imageAngle += 360;
		
	}
	
    self.hour_ImageView.transform = CGAffineTransformMakeRotation( imageAngle *  M_PI / 180 );
	
	self.integerHour = imageAngle / 30;
	
	[self.clockRecognizer hour: self.integerHour];
	
}

@end
