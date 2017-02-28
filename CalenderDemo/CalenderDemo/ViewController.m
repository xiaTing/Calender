//
//  ViewController.m
//  CalenderDemo
//
//  Created by 夏婷 on 2017/2/28.
//  Copyright © 2017年 夏婷. All rights reserved.
//

#import "ViewController.h"
#import "YYCalenderViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.DateLabel.userInteractionEnabled = YES;
    self.navigationController.navigationBarHidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectedDate:(UITapGestureRecognizer *)sender {
    
    YYCalenderViewController *calender = [[YYCalenderViewController alloc]initWithStyle:AllowSelectPastStyle];
    calender.selectDate = ^(NSString * dateStr){
        UILabel *label = (UILabel *)sender.view;
        label.text = dateStr;
    };
    [self.navigationController pushViewController:calender animated:YES];
    
    
}

@end
