//
//  NTClockMinuteView.h
//  ClockRotationGesture
//
//  Created by ビザンコムマック０９ on 2014/08/17.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockGestureRecognizer.h"
#import "NTClockRecognizer.h"

@interface NTClockMinuteView : UIView < NTClockGestureRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIImageView *minute_ImageView;

@property NTClockRecognizer *clockRecognizer;
@property NSInteger integerMinute;

@end
