//
//  KitchenSink.h
//  DongleBoisLab1
//
//  Created by Kevin Queenan, Jr. on 9/6/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KitchenSink : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepperControl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *segmentedLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

- (IBAction)stepperChanged:(UIStepper *)sender;
- (IBAction)indexChanged:(UISegmentedControl *)sender;

@end
