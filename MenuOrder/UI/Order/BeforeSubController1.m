//
//  BeforeSubController1.m
//  MenuOrder
//
//  Created by spmno on 13-5-31.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "BeforeSubController1.h"
#import "DishCountController.h"
#import "DishCountController1.h"
@interface BeforeSubController1 ()

@end

@implementation BeforeSubController1

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)orderPassionFruit:(id)sender {
    DishCountController1* dishController = [[DishCountController1 alloc]initWithNibName:@"DishCountController1" bundle:nil];
    dishController.modalPresentationStyle = UIModalPresentationFormSheet;
    dishController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dishController animated:NO completion:nil];
    dishController.view.superview.frame = CGRectMake(0, 0, 520, 350);
    dishController.view.superview.center = self.view.center;
    NSLog(@"order passion fruit");
}

- (IBAction)orderMatsutake:(id)sender {
    DishCountController1* dishController = [[DishCountController1 alloc]initWithNibName:@"DishCountController1" bundle:nil];
    dishController.modalPresentationStyle = UIModalPresentationFormSheet;
    dishController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:dishController animated:NO completion:nil];
    dishController.view.superview.frame = CGRectMake(0, 0, 520, 350);
    dishController.view.superview.center = self.view.center;
    
    NSLog(@"order matsutake");
}
@end
