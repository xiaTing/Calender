//
//  YYCalenderCell.m
//  YYCalenderDemo
//
//  Created by xiating on 14-8-6.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "YYCalenderCell.h"
#import "YYDateCalculate.h"

@implementation YYCalenderCell

@synthesize headView,year = _year,month = _month,masterLabel,weekLabelArray,dayLabelArray;
@synthesize TapDayCell;

-(id)initWithFrame:(CGRect)frame year:(NSInteger)newYear month:(NSInteger)newMonth
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        weekLabelArray = [[NSMutableArray alloc]init];
        dayLabelArray = [[NSMutableArray alloc]init];
        self.year = newYear;
        self.month = newMonth;
        [self setup];
    }
    return self;
}
-(void)setup
{
    /*
    UILabel *masterLabelUnit = [[UILabel alloc]initWithFrame:CGRectMake(masterLabel.frame.origin.x+masterLabel.frame.size.width, 16.0, 34, 24)];
    masterLabelUnit.backgroundColor = [UIColor clearColor];
    masterLabelUnit.textAlignment = NSTextAlignmentLeft;
    masterLabelUnit.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    masterLabelUnit.text = @"月";
    masterLabelUnit.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [headView addSubview:masterLabelUnit];
    CGFloat xOffset = self.frame.size.width/7.0;
    CGFloat yOffset = 44.0;
    for (NSInteger i = 0; i < 7; i++)
    {
        UILabel *dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset*i, yOffset, xOffset, 20)];
        dayOfTheWeekLabel.textColor = [UIColor blackColor];
        dayOfTheWeekLabel.textAlignment = NSTextAlignmentCenter;
        dayOfTheWeekLabel.backgroundColor = [UIColor clearColor];
        dayOfTheWeekLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
        [headView addSubview:dayOfTheWeekLabel];
        [weekLabelArray addObject:dayOfTheWeekLabel];
    }
    [self updateWithDayNames:[NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil]];
    */
    [self createMonthView];
    
}
/*
-(void)updateWithDayNames:(NSArray *)dayNames
{
    for (NSInteger i = 0; i < [dayNames count]; i++)
    {
        UILabel *label = (UILabel *)[weekLabelArray objectAtIndex:i];
        label.text = dayNames[i];
        if (i==0) {
            label.textColor = [UIColor redColor];
        }
        if (i == dayNames.count-1) {
            label.textColor = [UIColor redColor];
        }
    }
}
*/
-(void)setCanOpreation:(BOOL)canOpreation
{
    _canOpreation = canOpreation;
}
-(void)updateMonthView
{
    masterLabel.text = [NSString stringWithFormat:@"%ld",(long)self.month];
    
    masterLabel.textColor = [UIColor redColor];
    CGFloat xOffset = self.frame.size.width / 7.0;
    CGFloat yOffset = self.frame.size.width / 7.0;//44.0;
    NSInteger monthDay = [YYDateCalculate getDayCountOfMonth:self.month year:self.year];
    NSInteger startNumber = [YYDateCalculate getStart:self.year month:self.month];
    for (NSInteger i = 0; i < [dayLabelArray count]; i++)
    {
        NSInteger numberX = (i+startNumber) % 7;
        NSInteger numberY = (i+startNumber) / 7;
        YYDayCell *cell = (YYDayCell *)[dayLabelArray objectAtIndex:i];
        cell.frame = CGRectMake((float)(numberX) * xOffset + 6, 5 + (float)(numberY) * yOffset, xOffset, yOffset);//
        cell.delegate = self;
        cell.month = self.month;
        cell.year = self.year;
        if (_canOpreation) {
            [cell setStyle:canClickedStyle];
        }
        cell.day = i + 1;
        if(numberX == 0 || numberX == 6)
        {
            [cell setWeekend];
        }
        if (i >= monthDay) {
            cell.hidden = YES;
        }else
        {
            cell.hidden = NO;
        }
    }
}
-(void)createMonthView
{
    //到这里了
    CGFloat xOffset = self.frame.size.width/7.0;
    CGFloat yOffset = self.frame.size.width/7.0;//44.0;
    NSInteger startNumber = [YYDateCalculate getStart:self.year month:self.month];
    for (NSInteger i = 0; i < 32; i++)
    {
        NSInteger numberX = (i+startNumber)%7;
        NSInteger numberY = (i+startNumber)/7;
        YYDayCell *cell = [[YYDayCell alloc]initWithFrame:CGRectMake((float)(numberX) * xOffset, 70 +  (float)(numberY) * yOffset, xOffset, yOffset)];
        if (_canOpreation) {
            [cell setStyle:canClickedStyle];
        }
        cell.delegate = self;
        [self addSubview:cell];
        [dayLabelArray addObject:cell];
        [cell setDay:i + 1];
    }
}

-(void)changeItemYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    TapDayCell(year,month,day);
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
