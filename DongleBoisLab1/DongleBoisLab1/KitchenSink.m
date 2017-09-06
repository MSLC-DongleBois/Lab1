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

- (IBAction)indexChanged:(UISegmentedControl *)sender {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _segmentedLabel.text = @"First";
        case 1:
            _segmentedLabel.text = @"Second";
        default:
            break;
    }
}
@end
