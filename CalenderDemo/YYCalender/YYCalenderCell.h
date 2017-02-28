//
//  YYCalenderCell.h
//  YYCalenderDemo
//
//  Created by xiating on 14-8-6.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYDayCell.h"



@interface YYCalenderCell : UIView<YYDayCellDelegate>

@property (nonatomic, retain) UIView *headView;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, retain) UILabel *masterLabel;
@property (nonatomic, retain) NSMutableArray *weekLabelArray;
@property (nonatomic, retain) NSMutableArray *dayLabelArray;
@property (nonatomic, copy) void (^TapDayCell)(NSInteger year,NSInteger month, NSInteger day);
@property (nonatomic, assign) BOOL canOpreation;
-(id)initWithFrame:(CGRect)frame year:(NSInteger)newYear month:(NSInteger)newMonth;

-(void)updateMonthView;

@end
