//
//  NTClockMinuteView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/17.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockMinuteView.h"

@interface NTClockMinuteView ()
{
	
@private CGFloat imageAngle;
@private NTClockGestureRecognizer *gestureRecognizer;
	
}

@end

@implementation NTClockMinuteView

/*- (id)initWithFrame: (CGRect)frame
{
    
	self = [super initWithFrame: frame];
	
    if (self) {
		
	}
    
	return self;
	
}*/

/*- (id)initWithCoder: (NSCoder *)decoder
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
			
			self.minute_ImageView   = [array objectAtIndex: 0];
			self.minute_ImageView.frame = subview.frame;
			
			imageAngle = 0;
			
			gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.minute_ImageView.frame
																		target: self];
			
			[self addGestureRecognizer: gestureRecognizer];
			
		}
		
	}
	
	return self;
	
}*/

+ (NTClockMinuteView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockMinuteView"
										  owner: nil
										options: nil] lastObject];
	
}

- (id) awakeAfterUsingCoder: (NSCoder *)aDecoder
{
	
    BOOL loadedFromSimpleVuew = ( [[self subviews] count] == 0 );
    
	if ( loadedFromSimpleVuew ) {
		
        NTClockMinuteView *clockMinuteView = [NTClockMinuteView loadInstanceOfViewFromNib];
		
        clockMinuteView.frame                  = self.frame;
        clockMinuteView.autoresizingMask       = self.autoresizingMask;
        clockMinuteView.alpha                  = self.alpha;
        clockMinuteView.userInteractionEnabled = self.userInteractionEnabled;
		
        return clockMinuteView;
		
    }
	
    return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	//self.clockRecognizer        = self.clockRecognizer;
	
}

- (void) rotation: (CGFloat) angle
{
    
    imageAngle += angle;
    
	if (imageAngle > 360) {
		
		imageAngle -= 360;
		
	} else if (imageAngle < 0) {
		
		imageAngle += 360;
		
	}
	
    self.minute_ImageView.transform = CGAffineTransformMakeRotation( imageAngle *  M_PI / 180 );
	
	self.integerMinute = imageAngle / 6;
	
	[self.clockRecognizer minute: self.integerMinute];
	
}

@end
