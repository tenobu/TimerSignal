//
//  NTClockRecognizer.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NTClockRecognizerDelegate < NSObject >

@optional

- (void)amPm  : (NSInteger)_integer;
- (void)hour  : (NSInteger)_integer;
- (void)minute: (NSInteger)_integer;

@end

@interface NTClockRecognizer : NSObject
{

	NSInteger integerAmPm;
	
}

@property (nonatomic, assign) id < NTClockRecognizerDelegate > delegate;

- (void)on;

- (void)amPm  : (NSInteger)_integer;
- (void)hour  : (NSInteger)_integer;
- (void)minute: (NSInteger)_integer;

@end
