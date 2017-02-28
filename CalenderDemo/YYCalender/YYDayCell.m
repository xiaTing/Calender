//
//  YYDayCell.m
//  YYCalenderDemo
//
//  Created by xiating on 14-8-5.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "YYDayCell.h"

@implementation YYDayCell
@synthesize button,dayLabel,explainLabel,day,month,year,delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        button = [UIButton buttonWithType:0];
        button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:nil forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"time_bg.png"] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"time_bg.png"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
         [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [self addSubview:button];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height- 0.3, self.frame.size.width, 0.3)];
        view.backgroundColor = DayCellLineColor;
        [self addSubview:view];
    }
    return self;
}

-(void)buttonAction:(UIButton *)sender
{
    button.selected = YES;
    
    if (delegate && [delegate respondsToSelector:@selector(changeItemYear:month:day:)]) {
        [delegate changeItemYear:self.year month:self.month day:self.day];
    }
}
-(BOOL)isToday
{
    NSDateComponents  *today =(NSDateComponents *)[[NSCalendar currentCalendar]components:(NSCalendarUnitEra|NSCalendarUnitCalendar|kCFCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    if (today.day == self.day && today.month == self.month && today.year == self.year) {
        return YES;
    }else
    {
        return NO;
    }
}
-(BOOL)isFuture
{
    
    NSDateComponents  *today =(NSDateComponents *)[[NSCalendar currentCalendar]components:(NSCalendarUnitEra|NSCalendarUnitCalendar|kCFCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSLog(@"%ld,%ld,%ld",(long)today.year,(long)today.month,(long)today.day);
    if (self.year > today.year) {
        return YES;
    }else if(self.year == today.year && self.month>today.month){
        return YES;
    }else if (self.year == today.year && self.month==today.month && self.day > today.day)
    {
        return YES;
    }
    return NO;
}
-(void)setWeekend
{
    if ([self isFuture]) {
        
        [button setTitleColor:weekendDayColor forState:UIControlStateNormal];
    }
    
}
-(void)setDay:(NSInteger)newDay
{
    day = newDay;
    [button setTitle:[NSString stringWithFormat:@"%ld",(long)day] forState:UIControlStateNormal];
    if ([self isToday]) {
        [button setTitleColor:futureDayColor forState:UIControlStateNormal];
        button.selected = YES;
        self.userInteractionEnabled = YES;
    }else
    {
       
         button.selected = NO;
        if ([self isFuture]) {
            self.userInteractionEnabled = YES;
            [button setTitleColor:futureDayColor forState:UIControlStateNormal];
        }else
        {
            if (_style == canClickedStyle) {
                self.userInteractionEnabled = YES;

            }else
                self.userInteractionEnabled = NO;
            [button setTitleColor:pastDayColor forState:UIControlStateNormal];
        }
    }
}
-(void)setStyle:(DayCellStyle)style
{
    _style = style;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
