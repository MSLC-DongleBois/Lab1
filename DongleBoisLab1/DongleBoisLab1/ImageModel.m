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
        // String which will contain http response body
        __block NSString *responseString;
        
        // Prepare http get request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:@"https://api.kellenschmidt.com/mslc-urls"]];
        [request setHTTPMethod:@"GET"];
        
        // Make http get request
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            responseString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            // Parse http response body
            NSData* responseData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
            NSArray *fetchedArr = json[@"data"];
            NSArray *imageUrls = [fetchedArr valueForKey:@"url"]; // Returns an array of image urls

            _imageNames = imageUrls;
            
            NSLog(@"The content of arry is %@", _imageNames);

        }] resume];
        
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
