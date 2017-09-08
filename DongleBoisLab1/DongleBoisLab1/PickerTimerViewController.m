//
//  PickerTimerViewController.m
//  DongleBoisLab1
//
//  Created by Logan Dorsey on 9/8/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "PickerTimerViewController.h"

@interface PickerTimerViewController ()

@end

@implementation PickerTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerData = @[@"Mobile", @"Sensing", @"And", @"Learning"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    return  _pickerData.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    _pickerLabel.text = _pickerData[row];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
