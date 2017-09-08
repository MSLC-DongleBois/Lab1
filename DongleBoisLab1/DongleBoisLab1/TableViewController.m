//
//  TableViewController.m
//  DongleBoisLab1
//
//  Created by Austin Chen on 9/5/17.
//  Copyright © 2017 DongleBois. All rights reserved.
//

#import "TableViewController.h"
#import "ImageModel.h"
#import "ViewController.h"

@interface TableViewController ()

@property (strong,nonatomic) ImageModel* myImageModel;

@end

@implementation TableViewController

-(ImageModel*)myImageModel {
    
    if (!_myImageModel) {
        _myImageModel = [ImageModel sharedInstance];
    }
    
    return _myImageModel;
}

- (IBAction)kitchenSink:(id)sender {
    
}
- (IBAction)pressKSButton:(id)sender {
    [self performSegueWithIdentifier:@"segueToKitchenSink" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    //spinner.tag = 12;
    [self.view addSubview:spinner];
    
    [self.myImageModel makeRequest: self.tableView];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.myImageModel.imageNames.count;
    }
    
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ImageNameCell" forIndexPath:indexPath];
        
        // Configure the cell...
        cell.textLabel.text = self.myImageModel.imageNames[indexPath.row];
        cell.detailTextLabel.text = @"more";
    }
    
    else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell" forIndexPath:indexPath];
        
        // Configure the cell...
        cell.textLabel.text = @"Collection";
        cell.detailTextLabel.text = @"more";
    }
    
    else if (indexPath.section == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"KitchenSinkCell" forIndexPath:indexPath];
        
        // Configure the cell...
        cell.textLabel.text = @"Kitchen Sink";
        cell.detailTextLabel.text = @"more";
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BOOL isVC = [[segue destinationViewController] isKindOfClass:[ViewController class]];
    
    
    if (isVC) {
        UITableViewCell* cell = (UITableViewCell*)sender;
        ViewController *vc = [segue destinationViewController];
        
        vc.imageUrl = cell.textLabel.text;
    }
    
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
