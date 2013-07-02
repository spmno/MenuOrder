//
//  BeforeController.m
//  MenuOrder
//
//  Created by spmno on 13-5-30.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "BeforeController.h"
#import "BeforeSubController1.h"
#import "DishSearchController.h"
@interface BeforeController ()

@end

@implementation BeforeController

@synthesize controllerContainer = _controllerContainer;

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
    _controllerContainer = [NSMutableArray arrayWithCapacity:1];
    BeforeSubController1* controller1 = [[BeforeSubController1 alloc] initWithNibName:@"BeforeSubController1" bundle:nil];
    [_controllerContainer addObject:controller1];
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
    return 1;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //UIImageView* imageView = (UIImageView*)view;
    //if (!view) {
    	//load new item view instance from nib
        //control events are bound to view controller in nib file
        //note that it is only safe to use the reusingView if we return the same nib for each
        //item view, if different items have different contents, ignore the reusingView value
   //     NSString *nibName = [NSString stringWithFormat: @"BeforeSubController%d", index+1];
   // 	view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
        //imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"b%d.jpg",index+1]]];
        //view = imageView;
   // } else {
        //[imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"r%d.jpg",index+1]]];
    //}
    UIViewController* controller = _controllerContainer[index];
    return controller.view;
    
}


- (IBAction)switchToMenu:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)switchToSearch:(id)sender
{
    DishSearchController* searchController = [[DishSearchController alloc]initWithNibName:@"DishSearchController" bundle:nil];
    [self presentViewController:searchController animated:YES completion:nil];
}
@end
