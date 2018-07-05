//
//  ViewController.m
//  YLDatePickerView
//
//  Created by McIntosh on 2018/7/5.
//  Copyright © 2018年 xyanl. All rights reserved.
//

#import "ViewController.h"
#import "LYSDatePickerController.h"

#import <UIColor+JYColor.h>
#import <NSDate+JYDate.h>
@interface ViewController ()<LYSDatePickerSelectDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController
- (IBAction)datePickerViewAction:(UIButton *)sender {
    LYSDatePickerController *datePicker = [[LYSDatePickerController alloc] init];
    
    datePicker.indicatorHeight = 0;
    datePicker.delegate = self;
    datePicker.headerView.backgroundColor = [UIColor jy_colorWithHexString:@"FFFFFF"];
    datePicker.headerView.centerItem.textColor = [UIColor jy_colorWithHexString:@"656E7B"];
    datePicker.headerView.leftItem.textColor = [UIColor jy_colorWithHexString:@"999999"];
    datePicker.headerView.rightItem.textColor = [UIColor jy_colorWithHexString:@"4A78F8"];
    datePicker.headerView.showTimeLabel = NO;
    datePicker.headerView.centerItem.title = @"选择时间";
    datePicker.pickHeaderHeight = 44;
    datePicker.pickType = LYSDatePickerTypeDayAndTime;

    datePicker.selectDate = [NSDate jy_dateTurnWithString:self.dateLabel.text dateFormatter:@"yyyy-MM-dd HH:mm:ss"];
    
    __weak typeof(self) weakSelf = self;
    [datePicker setDidSelectDatePicker:^(NSDate *date) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *currentDate = [dateFormat stringFromDate:date];
        NSLog(@"选择时间 => %@",currentDate);
        weakSelf.dateLabel.text = currentDate;
    }];
    [datePicker showDatePickerWithController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
