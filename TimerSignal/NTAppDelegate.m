//
//  NTAppDelegate.m
//  TimeSignal
//
//  Created by ビザンコムマック０９ on 2014/06/26.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTAppDelegate.h"

@implementation NTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setString_StartTime:(NSString *)_string_StartTime
{
	
	NSString *string_am_pm  = [_string_StartTime substringWithRange: NSMakeRange( 0, 2 )];
	NSString *string_hour   = [_string_StartTime substringWithRange: NSMakeRange( 3, 2 )];
	NSString *string_minute = [_string_StartTime substringWithRange: NSMakeRange( 6, 2 )];
	
	if ( [string_am_pm isEqualToString: @"PM"] ) {
		
		string_hour = [NSString stringWithFormat: @"%02ld", string_hour.integerValue + 12];
		
	}
	
	self.string_StartTime24 = [NSString stringWithFormat: @"%@:%@:00", string_hour, string_minute];

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss"];
	
	NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat: @"HH:mm:ss"];
	
	NSDate *time = [timeFormatter dateFromString: self.string_StartTime24];

	NSString *string_time = [dateFormatter stringFromDate: time];
	
	NSLog( @"%@", string_time );
	
}

- (NSString *)string_StartTime
{
	
	NSString *string_start = self.string_StartTime;
	
	return string_start;
	
}

- (void)setString_EndTime:(NSString *)_string_EndTime
{
	
	NSString *string_am_pm  = [_string_EndTime substringWithRange: NSMakeRange( 0, 2 )];
	NSString *string_hour   = [_string_EndTime substringWithRange: NSMakeRange( 3, 2 )];
	NSString *string_minute = [_string_EndTime substringWithRange: NSMakeRange( 6, 2 )];
	
	if ( [string_am_pm isEqualToString: @"PM"] ) {
		
		string_hour = [NSString stringWithFormat: @"%02ld", string_hour.integerValue + 12];
		
	}
	
	self.string_EndTime24 = [NSString stringWithFormat: @"%@:%@:00", string_hour, string_minute];
	
}

- (NSString *)string_EndTime
{
	
	return self.string_EndTime;
	
}

// 開始時間のセット
/*- (void)setStartDateTime: (NSString *)start_date_time
{
    
    startDateTime = start_date_time;
    
}

// 終了時間のセット
- (void)setStopDateTime: (NSString *)stop_date_time
{
    
    stopDateTime = stop_date_time;
    
}

// 開始時間の取得
- (NSString *)startDateTime
{
    
    return startDateTime;
    
}

// 停止時間の取得
- (NSString *)stopDateTime
{
    
    return stopDateTime;
    
}*/

@end
