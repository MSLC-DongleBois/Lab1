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
        [self makeRequest:nil];
    }
    
    return _imageNames;
}

-(void) makeRequest: (UITableView*) picture {
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
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [picture reloadData];
        });
        
        
    }] resume];

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
