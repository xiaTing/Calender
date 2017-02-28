//
//  YYDayCell.h
//  YYCalenderDemo
//
//  Created by xiating on 14-8-5.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define pastDayColor [UIColor colorWithRed:211/255.0f green:211/255.0f blue:211/255.0f alpha:1]
#define futureDayColor [UIColor colorWithRed:111/255.0f green:111/255.0f blue:111/255.0f alpha:1]
#define weekendDayColor [UIColor colorWithRed:222/255.0f green:0/255.0f blue:0/255.0f alpha:1]
#define DayCellLineColor [UIColor colorWithRed:182/255.0f green:182/255.0f blue:182/255.0f alpha:1]

@protocol YYDayCellDelegate <NSObject>

@optional
-(void)changeItemYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end

typedef enum {
    canClickedStyle =0,
    unClickedStyle,
    
}DayCellStyle;

@interface YYDayCell : UIView
@property (nonatomic, weak) id<YYDayCellDelegate>delegate;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, retain) UILabel *dayLabel;
@property (nonatomic, retain) UILabel *explainLabel;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) DayCellStyle style;
-(void)setWeekend;
-(void)setStyle:(DayCellStyle)style;

@end
