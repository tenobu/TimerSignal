//
//  NTClockHariView.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/29.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockHariView.h"

@implementation NTClockHariView

- (id)initWithFrame: (CGRect)frame
{
    
	self = [super initWithFrame: frame];
	
    if (self) {
		
	}
    
	return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	self.userInteractionEnabled = YES;
	
}

@end
