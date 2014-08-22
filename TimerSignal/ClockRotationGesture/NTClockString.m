//
//  NTClockString.m
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/20.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockString.h"

@implementation NTClockString

- (void)setTimeString:(NSString *)_string
{

	//self.timeString = _timeString;
	
}

/*- (NSString *)timeString
{

	return self.timeString;
	
}*/

- (void)time: (NSString *)_string
{
	
	if ( [self.delegate respondsToSelector: @selector(time:)] ) {
		
        [self.delegate time: _string];
		
    }
	
}

@end
