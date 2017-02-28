//
//  YYDNaview.m
//  TPSApp
//
//  Created by xiating on 14-7-4.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "YYDNaview.h"


@interface YYDNaview ()

@property (nonatomic, retain) UILabel *titleLabel;
//@property (nonatomic, retain) UILabel *leftLabel;     //为了修复预订Tab中左上角消息按钮无点击效果，将这个label改成了public

@end

@implementation YYDNaview
@synthesize editing = _editing;
@synthesize leftButton = _leftButton,rightButton = _rightButton,leftTitle = _leftTitle,rightTitle = _rightTitle;
@synthesize titleLabel = _titleLabel,leftLabel = _leftLabel;
@synthesize navTitle = _navTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:34/255.0f green:41/255.0f blue:44/255.0f alpha:1];
        self.leftButton = [UIButton buttonWithType:0];
        [self.leftButton setFrame:CGRectMake(0, 20, 44, 44)];
        [_leftButton setImage:[UIImage imageNamed:@"Navback.png"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.frame = CGRectMake(0, 0, 45, 45);
        _leftLabel.font = [UIFont systemFontOfSize:14];
        _leftLabel.textAlignment = NSTextAlignmentRight;
        _leftLabel.textColor = [UIColor whiteColor];
        _leftLabel.userInteractionEnabled = YES;
        [_leftButton addSubview:_leftLabel];
        self.rightButton = [UIButton buttonWithType:0];
        [_rightButton setFrame:CGRectMake(275, 20, 45, 45)];
        _rightButton.backgroundColor = [UIColor clearColor];
        _rightTitleL =  [[UILabel alloc]initWithFrame:_rightButton.bounds];
        _rightTitleL.textAlignment = NSTextAlignmentLeft;
        _rightTitleL.text = @"编辑";
        _rightTitleL.font = [UIFont systemFontOfSize:14];
        _rightTitleL.textColor = [UIColor whiteColor];
        [_rightButton addSubview:_rightTitleL];
        [self addSubview:_rightButton];
        
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_SIZE.width - 160)/2, 20, 160, 45)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:_titleLabel];
       
    }
    return self;
}
-(void)setEditing:(BOOL)editing
{
    _editing = editing;
    if (!_editing) {
        self.leftButton.hidden = NO;
        [_leftButton setImage:[UIImage imageNamed:@"Navback.png"] forState:UIControlStateNormal];
        
        [self setRightTitle:@"编辑"];
        [self setLeftTitle:@""];
    } else {
        
        [_leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self setLeftTitle:@"取消"];
        [self setRightTitle:@"保存"];
        
    }

}



-(void)addTarget:(id)target action:(SEL)method
{
    [_leftButton addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:method];
    gesture.numberOfTapsRequired = 1;
    gesture.numberOfTouchesRequired = 1;
    [_leftLabel addGestureRecognizer:gesture];
}

-(void)addTarget:(id)target rightBtnAction:(SEL)method
{
    [self.rightButton addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
}
-(void)setRightTitle:(NSString *)rightTitle
{
    if (![_rightTitle isEqualToString:rightTitle]) {
        if (_rightTitle) {
            _rightTitle = nil;
        }
        
        _rightTitle = rightTitle;
        _rightTitleL.text = _rightTitle;
    }
}

-(void)setLeftTitle:(NSString *)leftTitle
{
    if (![_leftTitle isEqualToString:leftTitle]) {
        if (_leftTitle) {
            _leftTitle = nil;
        }
        _leftTitle = leftTitle;
        _leftLabel.text = _leftTitle ? _leftTitle :@"";
        if (![_leftTitle isEqualToString:@""]) {
            
            [_leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }else
        {
           [_leftButton setImage:[UIImage imageNamed:@"Navback.png"] forState:UIControlStateNormal];
        }
    }
}

-(void)setNavTitle:(NSString *)navTitle
{
    if (![_navTitle isEqualToString:navTitle]) {
        if (_navTitle) {
            _navTitle = nil;
        }
        _navTitle = navTitle;
        _titleLabel.text = _navTitle;
    }
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
