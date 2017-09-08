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

-(NSArray*) pickerData{
    
    if (!_pickerData) {
        _pickerData = @[@"Mobile", @"Sensing", @"And", @"Learning"];
    }
    
    return _pickerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return  self.pickerData.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    _pickerLabel.text = self.pickerData[row];
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
