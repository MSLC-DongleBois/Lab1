//
//  KitchenSink.h
//  DongleBoisLab1
//
//  Created by Kevin Queenan, Jr. on 9/6/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KitchenSink : UIView

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *segmentedLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)indexChanged:(UISegmentedControl *)sender;

@end