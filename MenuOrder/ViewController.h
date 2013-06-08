//
//  ViewController.h
//  MenuOrder
//
//  Created by spmno on 13-5-25.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel/iCarousel.h"
@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, UIPopoverControllerDelegate>
{
    UIPopoverController *popover;
}

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)doSearchDish:(id)sender;
- (IBAction)showOrderResult:(id)sender;

@end
