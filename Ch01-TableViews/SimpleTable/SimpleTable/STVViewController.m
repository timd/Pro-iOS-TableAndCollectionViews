//
//  STVViewController.m
//  SimpleTable
//
//  Created by Tim on 08/05/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "STVViewController.h"

@interface STVViewController ()
@property (nonatomic, strong) NSMutableArray *tableData; // holds the table data
@end

@implementation STVViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    // Run the superclass's viewDidLoad method
    [super viewDidLoad];
    
    // Create the array to hold the table data
    self.tableData = [[NSMutableArray alloc] init];
    
    // Create and add 10 data items to the table data array
    for (NSUInteger i=0; i < 10; i++) {
        
        // The cell will contain a string "Item X"
        NSString *dataString = [NSString stringWithFormat:@"Item %d", i];
        
        // Here the new string is added to the end of the array
        [self.tableData addObject:dataString];
        
    }
    
    // Print out the contents of the array into the log
    NSLog(@"The tableData array contains %@", self.tableData);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    return cell;
    
}

#pragma mark -
#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Table row %d has been tapped", indexPath.row);
    
    NSString *messageString = [NSString stringWithFormat:@"You tapped row %d", indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row tapped" message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
}

@end
