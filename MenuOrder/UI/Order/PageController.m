//
//  PageController.m
//  MenuOrder
//
//  Created by spmno on 13-7-24.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PageController.h"
#import "DishCountController1.h"
#import "../../Data/DisplayPage.h"
#import "../../Data/DisplayItem.h"
#import "../../Data/OrderManager.h"
#import "../../Data/DataManager.h"
@interface PageController ()

@end

@implementation PageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithPage:(DisplayPage *)page
{
    displayPage = page;

    return [super init];
}
            
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *imageUrlItems = [displayPage.imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = [imageUrlItems lastObject];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentDirectory stringByAppendingPathComponent:imageName];
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:imagePath];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
    
    for (DisplayItem* item in displayPage.subItems) {
        UIButton *uiButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        uiButton.frame = CGRectMake([item.x integerValue], [item.y integerValue], [item.width integerValue], [item.height integerValue]);
        uiButton.tag = [item.dishId integerValue];
        [uiButton addTarget:self action:@selector(pageButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:uiButton];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) pageButtonPressed: (id) sender
{
    OrderManager *orderManager = [OrderManager sharedInstance];
    DataManager *dataManager = [DataManager sharedInstance];
    UIButton *pressButton = (UIButton*) sender;
    NSNumber *dishKey = [NSNumber numberWithInt:pressButton.tag];
    Dish *pushDish = [dataManager.wholeDishContainer objectForKey: dishKey];
    [orderManager setCurrentDish:pushDish];
    DishCountController1* dishController = [[DishCountController1 alloc]initWithNibName:@"DishCountController1" bundle:nil];
    dishController.modalPresentationStyle = UIModalPresentationFormSheet;
    dishController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dishController animated:NO completion:nil];
    dishController.view.superview.frame = CGRectMake(0, 0, 520, 350);
    dishController.view.superview.center = self.view.center;
}
@end
