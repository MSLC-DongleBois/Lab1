//
//  KitchenSink.m
//  DongleBoisLab1
//
//  Created by Kevin Queenan, Jr. on 9/6/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "KitchenSink.h"

@implementation KitchenSink

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)Touch:(id)sender {
    _buttonLabel.text = @"Pressed!";
}

- (IBAction)Switch:(UISwitch *)sender {
    switch (_switchControl.on) {
        case NO:
            _switchLabel.text = @"😔";
            break;
        case YES:
            _switchLabel.text = @"😁";
            break;
        default:
            break;
    }

}


- (IBAction)slider:(id)sender forEvent:(UIEvent *)event {
    
    _sliderLabel.text = [NSString stringWithFormat:@"%f", _slider.value];
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    NSInteger val = sender.value;
    _stepperLabel.text = [NSString stringWithFormat:@"%02lu", val];
}

- (IBAction)indexChanged:(UISegmentedControl *)sender {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _segmentedLabel.text = @"First";
            break;
        case 1:
            _segmentedLabel.text = @"Second";
            break;
        default:
            break;
    }
}
@end
