//
//  NTClockRecognizer.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockRecognizer.h"

@implementation NTClockRecognizer

- (void)amPm: (NSInteger)_integer
{
	
	if ( [self.delegate respondsToSelector: @selector(amPm:)] ) {
		
        [self.delegate amPm: _integer];
		
    }
	
}

- (void)hour: (NSInteger)_integer
{
	
	if ( [self.delegate respondsToSelector: @selector(hour:)] ) {
		
        [self.delegate hour: _integer];
		
    }
	
}

- (void)minute: (NSInteger)_integer
{
	
	if ( [self.delegate respondsToSelector: @selector(minute:)] ) {
		
        [self.delegate minute: _integer];
		
    }
	
}

@end
