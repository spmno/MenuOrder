//
//  TotalOrderController1.h
//  MenuOrder
//
//  Created by spmno on 13-6-13.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Data/OrderManager.h"
@protocol TotalOrderDelegate <NSObject>

- (void) dismissPopoverView;

@end

@interface TotalOrderController1 : UIViewController <UITableViewDelegate, UITableViewDataSource, OrderManagerDelegate>
{
    NSArray *displaySet;
    UIAlertView *alertView;
}
@property (weak, nonatomic) id<TotalOrderDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *orderTable;
- (IBAction)checkOut:(id)sender;
- (IBAction)cancelCheckOut:(id)sender;

@end

