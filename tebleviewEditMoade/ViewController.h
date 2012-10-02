//
//  ViewController.h
//  tebleviewEditMoade
//
//  Created by ishan on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *aa;
    
    IBOutlet UITableView *tblaa;
    
    NSMutableArray *listOfItems;
    NSMutableArray *copyListOfItems;
    IBOutlet UISearchBar *searchBar;
    BOOL searching;
    BOOL letUserSelectRow;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblaa;
- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;
@end
