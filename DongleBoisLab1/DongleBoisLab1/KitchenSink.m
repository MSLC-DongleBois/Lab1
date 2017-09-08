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
    self.buttonLabel.text = @"Pressed!";
}

- (IBAction)Switch:(UISwitch *)sender {
    switch (self.switchControl.on) {
        case NO:
            self.switchLabel.text = @"😔";
            break;
        case YES:
            self.switchLabel.text = @"😁";
            break;
        default:
            break;
    }

}


- (IBAction)slider:(id)sender forEvent:(UIEvent *)event {
    
    self.sliderLabel.text = [NSString stringWithFormat:@"%f", self.slider.value];
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    NSInteger val = sender.value;
    self.stepperLabel.text = [NSString stringWithFormat:@"%02lu", val];
}

- (IBAction)indexChanged:(UISegmentedControl *)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.segmentedLabel.text = @"First";
            break;
        case 1:
            self.segmentedLabel.text = @"Second";
            break;
        default:
            break;
    }
}
@end
