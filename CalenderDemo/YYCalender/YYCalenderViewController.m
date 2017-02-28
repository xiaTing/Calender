//
//  YYCalenderViewController.m
//  YYCalenderDemo
//
//  Created by xiating on 14-8-6.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "YYCalenderViewController.h"
#import "YYDateObject.h"
#import "YYCalenderCell.h"
#import "YYDateCalculate.h"
#import "YYDNaview.h"


@interface YYCalenderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    NSMutableArray *dataArray;
    YYDateObject *fromDate;
    YYDateObject *toDate;
    YYDNaview *nav;
    NSMutableArray *weekLabelArray;
    NSInteger indexOfMonth;
}
@end

@implementation YYCalenderViewController
@synthesize  selectDate = _selectDate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        nav = [[YYDNaview alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 90)];
        nav.rightButton.hidden = YES;
        nav.editing = NO;
        nav.navTitle = @"选择日期";
        [nav addTarget:self action:@selector(backToPreView:)];
        [self.view addSubview:nav];
        weekLabelArray = [[NSMutableArray alloc]init];
        CGFloat xOffset = SCREEN_SIZE.width / 7.0;
        CGFloat yOffset = 64;
        for (NSInteger i = 0; i < 7; i++)
        {
            UILabel *dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset*i + 6, yOffset, xOffset, 20)];
            dayOfTheWeekLabel.textColor = [UIColor whiteColor];
            dayOfTheWeekLabel.textAlignment = NSTextAlignmentCenter;
            dayOfTheWeekLabel.backgroundColor = [UIColor clearColor];
            dayOfTheWeekLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0];
            [nav addSubview:dayOfTheWeekLabel];
            [weekLabelArray addObject:dayOfTheWeekLabel];
        }
        [self updateWithDayNames:[NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil]];
    }
    return self;
}
-(id)initWithStyle:(CalenderStyle)style
{
    self = [super init];
    if (self) {
        self.style = style;
        NSDateComponents  *today =(NSDateComponents *)[[NSCalendar currentCalendar]components:(NSCalendarUnitEra|NSCalendarUnitCalendar|kCFCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
        
        dataArray = [[NSMutableArray alloc]init];
        NSInteger fromYear = 0;
        if (self.style == NonePastStyle) {
            fromYear = today.year;
        }else
        {
            fromYear = today.year -1;
        }
        NSInteger toYear = today.year + 1;
        NSInteger fromMonth = today.month;
        NSInteger toMonth = today.month;
        NSInteger number = (toYear - fromYear) *12 + toMonth - fromMonth +1;
        for (NSInteger  i = 0; i < number; i++)
        {
            YYDateObject *object = [[YYDateObject alloc]init];
            object.year = fromYear;
            object.month = fromMonth + i;
            object.year = fromYear + (fromMonth+i) / 12;
            if (object.month % 12 == 0){
                object.year = object.year - 1;
                object.month =  fromMonth + i - (fromMonth+i) / 12 * 12 + 12;
            }else{
                object.month =  fromMonth + i - (fromMonth+i) / 12 * 12;
            }
            
            if (object.year == today.year && object.month == today.month) {//记录当月所在的位置
                indexOfMonth = i;
            }
            [dataArray addObject:object];
        }
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    if (indexOfMonth != 0) {
       table.contentOffset = CGPointMake(0, 224 *(indexOfMonth + 1.5) + 30);
    }
    
    
}
-(void)backToPreView:(id)sender
{
    if (self.selectDate) {
        self.selectDate(nil);
    }
    self.view.userInteractionEnabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)updateWithDayNames:(NSArray *)dayNames
{
    for (NSInteger i = 0; i < [dayNames count]; i++)
    {
        UILabel *label = (UILabel *)[weekLabelArray objectAtIndex:i];
        label.text = dayNames[i];
        if (i==0) {
            label.textColor = weekendDayColor;
        }
        if (i == dayNames.count-1) {
            label.textColor = weekendDayColor;
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ViewBackgroundColor;
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, SCREEN_SIZE.width, SCREEN_SIZE.height - 70) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.separatorColor = [UIColor clearColor];
    table.dataSource =self;
    table.delegate = self;
    [self.view addSubview:table];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        YYCalenderCell *calendarCell = [[YYCalenderCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width - 10, (SCREEN_SIZE.width / 7.0) * 5 + 20) year:2014 month:1];
        [cell.contentView addSubview:calendarCell];
        calendarCell.tag = 1000001;
    }
    YYCalenderCell *cellView = (YYCalenderCell *)[(YYCalenderCell *)cell.contentView viewWithTag:1000001];
    NSInteger section = indexPath.section;
    YYDateObject *object = [dataArray objectAtIndex:section];
    cellView.year = object.year;
    cellView.month = object.month;
    cellView.TapDayCell = ^(NSInteger year,NSInteger month,NSInteger day){
        if (self.selectDate) {
            NSString *monthStr = nil;
            NSString *dayStr = nil;
            if (month < 10)
            {
                monthStr = [NSString stringWithFormat:@"0%ld",(long)month];
            }else{
               monthStr = [NSString stringWithFormat:@"%ld",(long)month];
            }
            if (day < 10) {
                dayStr = [NSString stringWithFormat:@"0%ld",(long)day];
            }else
            {
                dayStr = [NSString stringWithFormat:@"%ld",(long)day];
            }
            self.selectDate([NSString stringWithFormat:@"%ld-%@-%@",(long)year,monthStr,dayStr]);
            self.view.userInteractionEnabled = NO;
            [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@YES afterDelay:0.5];
        }
    };
    if (_style == AllowSelectPastStyle) {
        cellView.canOpreation = YES;
    }
    [cellView updateMonthView];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYDateObject *object = [dataArray objectAtIndex:indexPath.section];
    NSInteger layer = [YYDateCalculate getLayer:object.year month:object.month];
    CGFloat y = 5 + (SCREEN_SIZE.width / 7.0) * layer;
    return y;
}

////#ifdef  _IOS_VERSION_8_OR_ABOVE
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    YYDateObject *object = [dataArray objectAtIndex:section];
//    return [NSString stringWithFormat:@"%ld年%ld月",(long)object.year,(long)object.month];
//}
//#else

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 23;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 23)];
    headerView.backgroundColor = [UIColor whiteColor];
    //secondHeaderColor;
    UIView *topLine = [[UIView alloc]init];
    topLine.frame = CGRectMake(0, 0, SCREEN_SIZE.width, 0.5);
    topLine.backgroundColor = DayCellLineColor;
//    [headerView addSubview:topLine];

    UIView *bottomLine = [[UIView alloc]init];
    bottomLine.frame = CGRectMake(0, 22.5, SCREEN_SIZE.width, 0.5);
    bottomLine.backgroundColor = DayCellLineColor;
//    [headerView addSubview:bottomLine];
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 23)];
    titleL.textColor = [UIColor blackColor];
    titleL.textAlignment = NSTextAlignmentCenter;
     YYDateObject *object = [dataArray objectAtIndex:section];
    titleL.text = [NSString stringWithFormat:@"%ld年%ld月",(long)object.year,(long)object.month];
   
    titleL.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:titleL];
    return headerView;
}
//#endif
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
