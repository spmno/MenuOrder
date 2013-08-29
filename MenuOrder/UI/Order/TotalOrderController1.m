//
//  TotalOrderController1.m
//  MenuOrder
//
//  Created by spmno on 13-6-13.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "TotalOrderController1.h"
#import "../../Data/OrderManager.h"
#import "../../Data/Dish.h"
#import "../../Data/OrderItem.h"
#import "OrderCell.h"

@interface TotalOrderController1 ()

@end

@implementation TotalOrderController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

        // Custom initialization
    //displaySet = [NSArray arrayWithObjects: @"One Dish", @"Two Dish", @"Three Dish", @"Total = $1000.00", nil];
    OrderManager *orderManager = [OrderManager sharedInstance];
    displaySet = orderManager.orderContainer;
    orderManager.delegate = self;
    _orderTable.delegate = self;
    _orderTable.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkOut:(id)sender
{
    [_delegate dismissPopoverView];
    OrderManager *orderManager = [OrderManager sharedInstance];
    [orderManager sendOrderToServer];
    //[[self valueForKey:@"ViewController"] dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelCheckOut:(id)sender
{
    [_delegate dismissPopoverView];
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
    return [displaySet count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderCell";
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OrderCell" owner:nil options:nil];
        //第一个对象就是CustomCell了
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell...
    NSLog(@"cell row = %d", indexPath.row);
    OrderItem *orderItem = (OrderItem*)displaySet[indexPath.row];
    //[cell.textLabel setText:orderItem.dish.name];
    [cell.dishName setText: orderItem.dish.name];
    NSNumberFormatter *countFormat = [[NSNumberFormatter alloc] init];
    NSNumberFormatter *priceFormat = [[NSNumberFormatter alloc] init];
    [cell.dishCount setText:[countFormat stringFromNumber:orderItem.count]];
    NSString *priceText = [NSString stringWithFormat:@"%.2f", [orderItem.dish.price floatValue]];
    [cell.dishPrice setText:priceText];
    return cell;
}

- (void) didFinishOrder
{
    alertView = [[UIAlertView alloc] initWithTitle:@"Order" message:@"创建定单成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
    [alertView show];
}

- (void) performDismiss
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
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
}


@end
