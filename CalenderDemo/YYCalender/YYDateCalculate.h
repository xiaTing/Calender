//
//  YYDateCalculate.h
//  YYCalenderDemo
//
//  Created by xiating on 14-8-5.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface YYDateCalculate : NSObject
+(NSInteger)getDayCountOfMonth:(NSInteger)month year:(NSInteger)year;
+(NSInteger)getStart:(NSInteger)year month:(NSInteger)month;
+(NSInteger)getLayer:(NSInteger)year month:(NSInteger)month;
@end
