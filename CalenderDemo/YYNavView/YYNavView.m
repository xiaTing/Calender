//
//  YYNavView.m
//  TravelRBS
//
//  Created by xiating on 14-5-16.
//  Copyright (c) 2014年 xiating. All rights reserved.
//

#import "YYNavView.h"

@interface YYNavView ()



@end

@implementation YYNavView

@synthesize leftButton = _leftButton,rightButton = _rightButton,navTitle = _navTitle;
@synthesize titleLabel = _titleLabel;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, SCREEN_SIZE.width, 65);
        self.backgroundColor = [UIColor colorWithRed:34/255.0f green:41/255.0f blue:44/255.0f alpha:1.0];
        
        
        self.leftButton = [UIButton buttonWithType:0];
        [self.leftButton setFrame:CGRectMake(10, 20, 44, 44)];//10原来是0
        [_leftButton setImage:[UIImage imageNamed:@"Navback.png"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        
        self.rightButton = [UIButton buttonWithType:0];
        [_rightButton setFrame:CGRectMake(275, 20, 45, 45)];
        _rightButton.backgroundColor = [UIColor clearColor];
        [self addSubview:_rightButton];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 28, 220, 30)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        
        [self addSubview:_titleLabel];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [self initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 65)];
    }
    return self;
}

-(void)setNavTitle:(NSString *)navTitle
{
    if (![_navTitle isEqualToString:navTitle]) {
        if (_navTitle) {
            _navTitle = nil;
        }
        _navTitle = [navTitle copy];
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
