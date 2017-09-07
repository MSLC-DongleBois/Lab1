//
//  ImageModel.m
//  DongleBoisLab1
//
//  Created by Austin Chen on 9/5/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;

-(NSArray*) imageNames{
    
    if (!_imageNames) {
        _imageNames = @[@"https://i.imgur.com/oGctO9a.jpg", @"https://i.imgur.com/Fen6QuJ.jpg", @"https://i.imgur.com/Bap1zTV.jpg"];
    }
    
    return _imageNames;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithUrl:(NSString *)Url {
    NSData * urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString: Url]];
    
    UIImage* image = nil;
    
    image = [[UIImage alloc] initWithData:urlData];
    
    return image;
}

@end
