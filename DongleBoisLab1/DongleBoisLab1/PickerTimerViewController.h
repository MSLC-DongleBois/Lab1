//
//  PickerTimerViewController.h
//  DongleBoisLab1
//
//  Created by Logan Dorsey on 9/8/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerTimerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (strong, nonatomic)NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UILabel *pickerLabel;

@end
