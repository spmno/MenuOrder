//
//  SubOrderController.m
//  MenuOrder
//
//  Created by spmno on 13-5-26.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "SubOrderController.h"
#import "DishSearchController.h"
#import "TotalOrderController.h"
#import "UIManager.h"
#import "DataManager.h"
#import "DisplayPage.h"

@interface SubOrderController ()

@end

@implementation SubOrderController
@synthesize swipeView = _swipeView;

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
    //configure swipe view
    _swipeView.alignment = SwipeViewAlignmentCenter;
    _swipeView.pagingEnabled = YES;
    _swipeView.wrapEnabled = NO;
    _swipeView.itemsPerPage = 1;
    _swipeView.truncateFinalPage = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    //generate 100 item views
    //normally we'd use a backing array
    //as shown in the basic iOS example
    //but for this example we haven't bothered
    DataManager *dataManager = [DataManager sharedInstance];
    UIManager *uiManager = [UIManager sharedInstance];  
    currentKindPages = [[NSMutableArray alloc] init];
    for (DisplayPage *page in dataManager.wholePageContainer) {
        if (page.kindId == uiManager.currentKindId) {
            [currentKindPages addObject:page];
        }
    }
    return [currentKindPages count];
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    DisplayPage *currentPage = [currentKindPages objectAtIndex:index];
    UIImageView* imageView = (UIImageView*)view;
    NSArray *imageUrlItems = [currentPage.imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = [imageUrlItems lastObject];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentDirectory stringByAppendingPathComponent:imageName];
    NSLog(@"page url = %@\n", imagePath);

    if (!view) {
    	//load new item view instance from nib
        //control events are bound to view controller in nib file
        //note that it is only safe to use the reusingView if we return the same nib for each
        //item view, if different items have different contents, ignore the reusingView value
        //NSString *nibName = [NSString stringWithFormat: @"SubOrderItem%d", index+1];
    	//view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
        //imageView = [[[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:imagePath]]];
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imagePath]];
        view = imageView;
    } else {
        [imageView setImage:[UIImage imageWithContentsOfFile:imagePath]];
    }
    
    return view;
}


- (IBAction)switchToMenu:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)switchToSearch:(id)sender
{
    //[self dismissViewControllerAnimated:NO completion:nil];
    DishSearchController* searchController = [[DishSearchController alloc]initWithNibName:@"DishSearchController" bundle:nil];
    [self presentViewController:searchController animated:YES completion:nil];
}

- (IBAction)switchToManual:(id)sender
{
    
}

- (IBAction)showOrderCount:(id)sender
{
    TotalOrderController* totalController = [[TotalOrderController alloc] init];
    totalController.contentSizeForViewInPopover = CGSizeMake(600, 800);
    popover = [[UIPopoverController alloc] initWithContentViewController:totalController];
    [popover setDelegate:self];
    
    [popover setPopoverContentSize:CGSizeMake(600, 800)];
    
    //设置箭头坐标--也是设置如何显示这个浮动框
    [popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}
@end
