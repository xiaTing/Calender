//
//  YYNavView.h
//  TravelRBS
//
//  Created by xiating on 14-5-16.
//  Copyright (c) 2014年 xiating. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYNavView : UIView
@property (nonatomic, retain) UIButton *leftButton;//左按钮
@property (nonatomic, retain) UIButton *rightButton;//右按钮
@property (nonatomic, copy) NSString *navTitle;
@property (nonatomic, retain) UILabel *titleLabel;

@end
