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
			
			self.integerAmPm = 1;
			
		}
		
	}
	
	return self;
	
}

- (IBAction)amPm_Action:(id)sender
{

	if ( self.integerAmPm == 1 ) {
		
		UIImage *image = [UIImage imageNamed: @"Enn_PM.png"];
		
		[self.button_AmPm setImage: image forState: UIControlStateNormal];
		
		self.integerAmPm = 2;
		
	} else if ( self.integerAmPm == 2 ) {
		
		UIImage *image = [UIImage imageNamed: @"Enn_AM.png"];
		
		[self.button_AmPm setImage: image forState: UIControlStateNormal];
		
		self.integerAmPm = 1;

	}
	
	[self.clockRecognizer amPm: self.integerAmPm];

}

@end
