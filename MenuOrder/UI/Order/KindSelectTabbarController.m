//
//  KindSelectTabbarController.m
//  MenuOrder
//
//  Created by spmno on 13-12-4.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "KindSelectTabbarController.h"
#import "DishSearchController.h"
#import "TotalOrderController.h"
#import "TotalOrderController1.h"
#import "KindSelectController.h"
#import "../UserManual/UserManualController.h"

@interface KindSelectTabbarController ()

@end

@implementation KindSelectTabbarController

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
    _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:50];
    KindSelectController *kindSelectController = [[KindSelectController alloc] initWithNibName:@"KindSelectController" bundle:nil];
    DishSearchController* searchController = [[DishSearchController alloc]initWithNibName:@"DishSearchController" bundle:nil];
    UserManualController* userManualController = [[UserManualController alloc]initWithNibName:@"UserManualController" bundle:nil];
    TotalOrderController1* totalController = [[TotalOrderController1 alloc]initWithNibName:@"TotalOrderController1" bundle:nil];
    // Do any additional setup after loading the view from its nib.
    [_tabBarController setViewControllers:[NSMutableArray arrayWithObjects:
                                           kindSelectController,
                                           searchController,
                                           userManualController,
                                           totalController,nil]];
    
    // Below you will find an example of the possible customizations, just uncomment the lines below
    
    // Tab background Image
    [_tabBarController setBackgroundImageName:@"tabbar_background.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
