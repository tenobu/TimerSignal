//
//  NTAppDelegate.h
//  TimeSignal
//
//  Created by ビザンコムマック０９ on 2014/06/26.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTAppDelegate : UIResponder <UIApplicationDelegate>
{

    //NSString *startDateTime, *stopDateTime;
    
}

@property (strong, nonatomic) UIWindow *window;

@property NSString *string_StartDate, *string_EndDate;
@property NSString *string_StartTime, *string_EndTime;
@property NSString *string_StartTime24, *string_EndTime24;

@property NSDate *date_Start, *date_End;

/*- (void)setStartDateTime: (NSString *)start_date_time;
- (NSString *)startDateTime;

- (void)setStopDateTime : (NSString *)stop_date_time;
- (NSString *)stopDateTime;*/

@end
