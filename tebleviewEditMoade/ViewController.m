//
//  ViewController.m
//  tebleviewEditMoade
//
//  Created by ishan on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tblaa;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    aa=[[NSMutableArray alloc]init];
        [aa addObject:@"ishan"];
        [aa addObject:@"janith"];
        [aa addObject:@"Samith"];
        [aa addObject:@"wathsala"];
        [aa addObject:@"gevan jayasingha"];
      // [tblaa setEditing: YES animated: YES];
   
        // tblaa.editing=YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    tblaa = nil;
    [self setTblaa:nil];
    [super viewDidUnload];
    
        
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        // Return the number of rows in the section.
    return [aa count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [aa objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
            // Delete the row from the data source
        if ([aa count] >= 1) {
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [aa removeObjectAtIndex:[indexPath row]];
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *somepath = [documentsDirectory stringByAppendingPathComponent:@"something.plist"];
            [aa writeToFile:somepath atomically:YES];
            
            if ([aa count] == 0) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            [tableView endUpdates];
        }
    }   
}

 


-(void)filter
{
  }

- (IBAction)filter:(id)sender {
       
        // NSPredicate *bPredicate =
//    [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'b'"];
//    NSArray *beginWithB =
//    [aa filteredArrayUsingPredicate:bPredicate];
        // beginWithB contains { @"Bill", @"Ben" }.
    
    NSPredicate *sPredicate =
    [NSPredicate predicateWithFormat:@"SELF contains[c] 'an'"];
    [aa filterUsingPredicate:sPredicate];
    NSLog(@"COunt is %d",aa.count);
    [tblaa reloadData];

}



@end
