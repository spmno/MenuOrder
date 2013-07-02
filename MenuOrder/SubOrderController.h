//
//  SubOrderController.h
//  MenuOrder
//
//  Created by spmno on 13-5-26.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeView/SwipeView.h"
@interface SubOrderController : UIViewController <SwipeViewDelegate, SwipeViewDataSource, UIPopoverControllerDelegate>
{
     UIPopoverController *popover;
}
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
- (IBAction)switchToMenu:(id)sender;
- (IBAction)switchToSearch:(id)sender;
- (IBAction)switchToManual:(id)sender;
- (IBAction)showOrderCount:(id)sender;

@end
