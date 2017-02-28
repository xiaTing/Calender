//
//  YYDateCalculate.m
//  YYCalenderDemo
//
//  Created by xiating on 14-8-5.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "YYDateCalculate.h"

@implementation YYDateCalculate
+(NSInteger)getDayCountOfMonth:(NSInteger)month year:(NSInteger)year
{
    switch (month) {
        case 1:
            return 31;
        case 3:
            return 31;
        case 4:
            return 30;
        case 5:
            return 31;
        case 6:
            return 30;
        case 7:
            return 31;
        case 8:
            return 31;
        case 9:
            return 30;
        case 10:
            return 31;
        case 11:
            return 30;
        case 12:
            return 31;
        default:
            break;
    }
    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
    {
        return 29;
    }
    else {
        return 28;
    }

}
+(NSInteger)getStart:(NSInteger)year month:(NSInteger)month
{
    NSInteger baseNumber;
    NSInteger startNumber;
    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
    {
        switch (month) {
            case 1:
                baseNumber = 0;
                break;
            case 2:
                baseNumber = 3;
                break;
            case 3:
                baseNumber = 4;
                break;
            case 4:
                baseNumber = 0;
                break;
            case 5:
                baseNumber = 2;
                break;
            case 6:
                baseNumber = 5;
                break;
            case 7:
                baseNumber = 0;
                break;
            case 8:
                baseNumber = 3;
                break;
            case 9:
                baseNumber = 6;
                break;
            case 10:
                baseNumber = 1;
                break;
            case 11:
                baseNumber = 4;
                break;
                
            case 12:
                baseNumber = 6;
                break;
                
            default:
                baseNumber = 0;
        }
        startNumber = (year + year/4 + year/400 - year/100 - 2 + baseNumber + 1) % 7;

    }
    
    else
    {
        switch (month) {
            case 1:
                baseNumber = 0;
                break;
            case 2:
                baseNumber = 3;
                break;

            case 3:
                baseNumber = 3;
                break;

            case 4:
                baseNumber = 6;
                break;

            case 5:
                baseNumber = 1;
                break;

            case 6:
                baseNumber = 4;
                break;

            case 7:
                baseNumber = 6;
                break;

            case 8:
                baseNumber = 2;
                break;

            case 9:
                baseNumber = 5;
                break;

            case 10:
                baseNumber = 0;
                break;

            case 11:
                baseNumber = 3;
                break;
            case 12:
                baseNumber = 5;
                break;

            default:
                baseNumber = 0;
        }
        startNumber = (year + year/4 + year/400 - year/100 - 1 + baseNumber + 1) % 7;
    }
    return startNumber;
}
+(NSInteger)getLayer:(NSInteger)year month:(NSInteger)month
{
    NSInteger monthDay = [self getDayCountOfMonth:month year:year];
    NSInteger startNumber = [self getStart:year month:month];
    NSInteger newLayer = monthDay + startNumber;
    NSInteger layer = ceilf((CGFloat)newLayer/7);
    return (NSInteger)layer;
}
@end
