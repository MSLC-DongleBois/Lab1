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
        _imageNames = @[@"Austin1", @"Austin2", @"Austin3"];
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

-(UIImage*)getImageWithName:(NSString *)name {
    UIImage* image = nil;
    image = [UIImage imageNamed: name];
    
    return image;
}

@end
