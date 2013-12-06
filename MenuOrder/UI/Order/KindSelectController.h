//
//  ViewController.h
//  MenuOrder
//
//  Created by spmno on 13-5-25.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel/iCarousel.h"
#import "TotalOrderController1.h"
@interface KindSelectController : UIViewController <iCarouselDataSource, iCarouselDelegate, UIPopoverControllerDelegate, TotalOrderDelegate>
{
    UIPopoverController *popover;
}

@property (strong, nonatomic) IBOutlet UIToolbar *menuToolbar;
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)doSearchDish:(id)sender;
- (IBAction)showOrderResult:(id)sender;
- (IBAction)enterUserManual:(id)sender;
- (void) dismissPopoverView;

@end
