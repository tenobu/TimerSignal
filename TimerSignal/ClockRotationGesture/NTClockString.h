//
//  NTClockString.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/20.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NTClockStringDelegate < NSObject >

@optional

- (void)time: (NSString *)_string;

@end

@interface NTClockString : NSObject

@property (nonatomic, assign) id < NTClockStringDelegate > delegate;
//@property NSString *timeString;

- (void)setTimeString: (NSString *)_string;

- (void)time: (NSString *)_string;

@end
