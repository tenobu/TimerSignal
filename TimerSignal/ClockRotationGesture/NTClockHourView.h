//
//  NTClockHourView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/18.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockHourView : UIView < NTClockGestureRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIImageView *hour_ImageView;

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integerHour;

@end
