//
//  BeforeController.h
//  MenuOrder
//
//  Created by spmno on 13-5-30.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../SwipeView/SwipeView.h"
#import "TotalOrderController1.h"
@interface BeforeController : UIViewController <SwipeViewDelegate, SwipeViewDataSource, UIPopoverControllerDelegate, TotalOrderDelegate>
{
    UIPopoverController *popover;
}
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
@property (strong, nonatomic) NSMutableArray* controllerContainer;
- (IBAction)switchToMenu:(id)sender;
- (IBAction)switchToSearch:(id)sender;
- (IBAction)showOrderResult:(id)sender;
- (IBAction)enterUserManual:(id)sender;
- (void) dismissPopoverView;
@end
