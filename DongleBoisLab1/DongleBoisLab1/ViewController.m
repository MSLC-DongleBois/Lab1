//
//  ViewController.m
//  DongleBoisLab1
//
//  Created by Austin Chen on 9/5/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"
@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong,nonatomic) ImageModel* myImageModel;

@end

@implementation ViewController

-(ImageModel*)myImageModel{
    
    if (!_myImageModel) {
        _myImageModel = [ImageModel sharedInstance];
    }
    
    return _myImageModel;
}

-(NSString*)imageUrl {
    
    if (!_imageUrl) {
        _imageUrl = @"https://i.imgur.com/7kZ562z.jpg";
    }
    
    return _imageUrl;
}

-(UIImageView*) imageView {
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithImage:[[ImageModel sharedInstance] getImageWithUrl:self.imageUrl]];
    }
    
    return _imageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.delegate = self;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}




@end

