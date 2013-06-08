//
//  SubOrderController.h
//  MenuOrder
//
//  Created by spmno on 13-5-26.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeView/SwipeView.h"
@interface SubOrderController : UIViewController <SwipeViewDelegate, SwipeViewDataSource>
@property (strong, nonatomic) IBOutlet SwipeView *swipeView;

@end
