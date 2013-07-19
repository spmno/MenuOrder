//
//  ViewController.m
//  MenuOrder
//
//  Created by spmno on 13-5-25.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "KindSelectController.h"
#import "SubOrderController.h"
#import "BeforeController.h"
#import "DishSearchController.h"
#import "TotalOrderController.h"
#import "TotalOrderController1.h"
#import "UserManualController.h"

@interface KindSelectController ()

@end

@implementation KindSelectController
@synthesize carousel;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.carousel.type = iCarouselTypeCoverFlow2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //UILabel *label = nil;
    
	//create new view if no view is available for recycling
	if (view == nil)
	{
        view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"h%d.jpg",index+1]]];

        //UIImage* imageView=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index+1]];
        //view.backgroundColor = [UIColor lightGrayColor];
        //label = [[UILabel alloc] initWithFrame:view.bounds];
        //label.backgroundColor = [UIColor clearColor];
        //label.textAlignment = UITextAlignmentCenter;
        //label.font = [label.font fontWithSize:50];
        //[view addSubview:imageView];
    }
    else
	{
//		[view setImageView:[UIImage imageNamed:[NSString stringWithFormat:@"h%d.jpg",index+1]]];
	}
	
    //set label
	//label.text = [NSString stringWithFormat:@"%i", index];
	
	return view;
}

- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        default:
        {
            return value;
        }
    }
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"select the %d item", index);
    switch (index) {
        case 0: {
            SubOrderController* subController = [[SubOrderController alloc]initWithNibName:@"SubOrderController" bundle:nil];
            [self presentViewController:subController animated:NO completion:nil];
            break;
        }
        case 1: {
            BeforeController* beforeController = [[BeforeController alloc]initWithNibName:@"BeforeController" bundle:nil];
            [self presentViewController:beforeController animated:NO completion:nil];
            break;

        }
            
        default:
            break;
    }
}

- (IBAction)doSearchDish:(id)sender
{
    DishSearchController* searchController = [[DishSearchController alloc]initWithNibName:@"DishSearchController" bundle:nil];
    searchController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:searchController animated:YES completion:nil];

}

- (IBAction)showOrderResult:(id)sender
{
    TotalOrderController1* totalController = [[TotalOrderController1 alloc] init];
    //[self presentViewController:totalController animated:YES completion:nil];
    
    totalController.contentSizeForViewInPopover = CGSizeMake(600, 800);

    popover = [[UIPopoverController alloc] initWithContentViewController:totalController];
    [popover setDelegate:self];
    
    [popover setPopoverContentSize:CGSizeMake(600, 800)];
    totalController.delegate = self;
    //设置箭头坐标--也是设置如何显示这个浮动框
    [popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

- (IBAction)enterUserManual:(id)sender
{
    UserManualController* userManualController = [[UserManualController alloc]initWithNibName:@"UserManualController" bundle:nil];
    [self presentViewController:userManualController animated:YES completion:nil];

}

- (void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"%@",@"谢谢");
}

- (void) dismissPopoverView
{
    [popover dismissPopoverAnimated:YES];
}
@end
