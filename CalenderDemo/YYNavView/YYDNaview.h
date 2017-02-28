//
//  YYDNaview.h
//  TPSApp
//
//  Created by xiating on 14-7-4.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYDNaview : UIView
@property (nonatomic, retain) UIButton *leftButton;//左按钮
@property (nonatomic, retain) UIButton *rightButton;//右按钮
@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *navTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, assign) BOOL editing;
@property (nonatomic, retain) UILabel *leftLabel;
@property (nonatomic, retain) UILabel *rightTitleL;



-(void)addTarget:(id)target action:(SEL)method;//左边按钮

-(void)addTarget:(id)target rightBtnAction:(SEL)method;//右边按钮方法

@end
