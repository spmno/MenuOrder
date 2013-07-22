//
//  DishCountController1.m
//  MenuOrder
//
//  Created by spmno on 13-6-8.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DishCountController1.h"

@interface DishCountController1 ()

@end

@implementation DishCountController1

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

- (IBAction)buttonOnePressed:(id)sender
{
    _countText.text = @"1";
}

- (IBAction)buttonTwoPressed:(id)sender
{
    _countText.text = @"2";
}

- (IBAction)buttonThreePressed:(id)sender
{
    _countText.text = @"3";
}

- (IBAction)buttonFourPressed:(id)sender
{
    _countText.text = @"4";
}

- (IBAction)buttonFivePressed:(id)sender
{
    _countText.text = @"5";
}

- (IBAction)buttonSixPressed:(id)sender
{
    _countText.text = @"6";
}

- (IBAction)buttonSevenPressed:(id)sender
{
    _countText.text = @"7";
}

- (IBAction)buttonEightPressed:(id)sender
{
    _countText.text = @"8";
}

- (IBAction)buttonNinePressed:(id)sender
{
    _countText.text = @"9";
}

- (IBAction)deleteText:(id)sender
{
    _countText.text = @"";
}

- (IBAction)confirmDishCount:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelDishCount:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
