//
//  YYCalenderViewController.h
//  YYCalenderDemo
//
//  Created by xiating on 14-8-6.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define secondHeaderColor [UIColor colorWithRed:246/255.0f green:246/255.0f blue:246/255.0f alpha:1]

typedef enum {
    NonePastStyle= 0,//
    AllowSelectPastStyle,
}CalenderStyle;
@interface YYCalenderViewController : UIViewController
@property (nonatomic, copy) void(^selectDate)(NSString *);

@property (nonatomic, assign) CalenderStyle style;
-(id)initWithStyle:(CalenderStyle)style;
@end
