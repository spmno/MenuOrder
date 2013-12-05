//
//  DishSearchController.m
//  MenuOrder
//
//  Created by spmno on 13-6-4.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DishSearchController.h"
#import "DataManager.h"
#import "Dish.h"
#import "pinyin.h"
#import "OrderManager.h"
#import "DishCountController1.h"

@interface DishSearchController ()
@property (nonatomic) NSMutableArray *searchResults;
@end

@implementation DishSearchController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _searchBar.keyboardType=UIKeyboardTypeDefault;
    _searchBar.delegate = self;
    //self.tableView.tableHeaderView = _searchBar;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //_searchBar.showsCancelButton = YES;
    [_searchBar sizeToFit];
    /*
    _searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchDisplayController.delegate = self;
    _searchDisplayController.searchResultsDataSource = self;
    _searchDisplayController.searchResultsDelegate = self;
     */
    _data = [[NSMutableOrderedSet alloc] init];
    _keys = [[NSMutableOrderedSet alloc] init];
    [self addWholeData];
}

- (NSString *)tabImageName
{
	return @"searchbutton_background";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.searchResults count];
    }
	else
	{
        return _data.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSString *text = [self.searchResults objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:text];
        return cell;
    } else {
        NSString *text = [_data objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:text];
        return cell;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    OrderManager *orderManager = [OrderManager sharedInstance];
    DataManager *dataManager = [DataManager sharedInstance];

    NSNumber *dishKey = [_keys objectAtIndex:indexPath.row];
    Dish *pushDish = [dataManager.wholeDishContainer objectForKey: dishKey];
    [orderManager setCurrentDish:pushDish];
    DishCountController1* dishController = [[DishCountController1 alloc]initWithNibName:@"DishCountController1" bundle:nil];
    dishController.modalPresentationStyle = UIModalPresentationFormSheet;
    dishController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dishController animated:NO completion:nil];
    dishController.view.superview.frame = CGRectMake(0, 0, 520, 350);
    dishController.view.superview.center = self.view.center;

}
#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [_data removeAllObjects];
    if (searchText.length == 0) {
        [self addWholeData];
    } else {
        DataManager *dataManager = [DataManager sharedInstance];
        NSDictionary *dishContainer = [dataManager wholeDishContainer];
        unichar ch = [searchText characterAtIndex:0];
        for (Dish* dish in [dishContainer objectEnumerator]) {
            //[_data addObject:dish.name];
            if (IS_CH_SYMBOL(ch)) {
                if ([dish.name hasPrefix:searchText]) {
                    [_data addObject:dish.name];
                    [_keys addObject:dish.id];
                }
            } else {
                for (int i = 0; i < searchText.length; ++i) {
                    if (pinyinFirstLetter([dish.name characterAtIndex:i]) == [searchText characterAtIndex:i]) {
                        if (i == searchText.length-1) {
                            [_data addObject:dish.name];
                            [_keys addObject:dish.id];
                        }
                    } else {
                        break;
                    }
                }
            }
            
        }

    }

    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void) addWholeData {
    DataManager *dataManager = [DataManager sharedInstance];
    
    NSDictionary *dishContainer = [dataManager wholeDishContainer];
    for (Dish* dish in [dishContainer objectEnumerator]) {
        //[_data addObject:dish.name];
        [_data addObject:dish.name];
        [_keys addObject:dish.id];
    }
}
@end
