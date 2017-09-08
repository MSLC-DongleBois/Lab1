//
//  TimerViewController.m
//  DongleBoisLab1
//
//  Created by Kevin Queenan, Jr. on 9/8/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "TimerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TimerViewController ()
{
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation TimerViewController

- (void) changeBackground {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    UIColor *randomColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    self.view.backgroundColor = randomColor;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    NSString *path = [NSString stringWithFormat:@"%@/Darude_Sandstorm.mp3", [[NSBundle mainBundle] resourcePath]];
//    NSURL *soundUrl = [NSURL fileURLWithPath:path];
//    
//    // Create audio player object and initialize with URL to sound
//    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    
//    _audioPlayer.numberOfLoops = -1;
//    
//    [_audioPlayer play];
    
    self.timerIvar  = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                       target:self
                                                     selector:@selector(changeBackground)
                                                     userInfo:nil
                                                      repeats:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    NSString *music = [[NSBundle mainBundle] pathForResource:@"Darude_Sandstorm" ofType:@"mp3"];
    _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
    _audioPlayer.numberOfLoops=-1;
    [_audioPlayer play];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    
    _audioPlayer.delegate = nil;
    [_audioPlayer stop];
    _audioPlayer = nil;
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
