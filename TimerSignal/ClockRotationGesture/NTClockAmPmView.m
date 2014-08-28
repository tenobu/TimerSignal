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

/*- (id)initWithCoder: (NSCoder *)decoder
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
			
			self.button_AmPm = [array objectAtIndex: 0];
			self.button_AmPm.frame = subview.frame;
			
			if ( self.integerAmPm == 0 ) {
				
				self.integerAmPm = 1;

			}
			
		}
		
	}
	
	return self;
	
}*/

+ (NTClockAmPmView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockAmPmView"
										  owner: nil
										options: nil] lastObject];
	
}

- (id) awakeAfterUsingCoder: (NSCoder *)aDecoder
{
	
    BOOL loadedFromSimpleVuew = ( [[self subviews] count] == 0 );
    
	if ( loadedFromSimpleVuew ) {
		
        NTClockAmPmView *clockAmPmView = [NTClockAmPmView loadInstanceOfViewFromNib];
		
        clockAmPmView.frame                  = self.frame;
        clockAmPmView.autoresizingMask       = self.autoresizingMask;
        clockAmPmView.alpha                  = self.alpha;
        clockAmPmView.userInteractionEnabled = self.userInteractionEnabled;
		
		//clockAmPmView.button_AmPm.frame      = self.button_AmPm.frame;

        return clockAmPmView;
		
    }
	
    return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	self.clockRecognizer = [[NTClockRecognizer alloc] init];
	
	self.integerAmPm = 1;
		
}

- (IBAction)amPm_Action:(id)sender
{
	
	/*NSLog( @"%@", self.button_AmPm );
	
	if ( self.integerAmPm == 1 ) {
		
		self.integerAmPm = 2;
		
	} else if ( self.integerAmPm == 2 ) {
		
		self.integerAmPm = 1;
		
	}*/

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
