//
//  ImageModel.h
//  DongleBoisLab1
//
//  Created by Austin Chen on 9/5/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

@property (strong, nonatomic) NSArray* imageNames;

+(ImageModel*) sharedInstance;

-(UIImage*)getImageWithUrl:(NSString*)Url;

-(void) makeRequest: (UITableView*) picture;


@end

