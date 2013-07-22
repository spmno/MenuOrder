//
//  BeforeController.h
//  MenuOrder
//
//  Created by spmno on 13-5-30.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../SwipeView/SwipeView.h"
@interface BeforeController : UIViewController <SwipeViewDelegate, SwipeViewDataSource>
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
@property (strong, nonatomic) NSMutableArray* controllerContainer;
- (IBAction)switchToMenu:(id)sender;
- (IBAction)switchToSearch:(id)sender;

@end
