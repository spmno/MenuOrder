//
//  DishCountController.m
//  MenuOrder
//
//  Created by spmno on 13-6-1.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DishCountController.h"

@interface DishCountController ()

@end

@implementation DishCountController
CGRect _realBounds;
@synthesize dishCountText = _dishCountText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.superview.bounds = _realBounds;
}
- (void)viewDidLoad
{
    _realBounds = self.view.bounds;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonOneTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 1];
}

- (IBAction)buttonTwoTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 2];
}

- (IBAction)buttonThreeTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 3];
}

- (IBAction)buttonFourTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 4];
}

- (IBAction)buttonFiveTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 5];
}

- (IBAction)buttonSixTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 6];
}

- (IBAction)buttonSevenTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 7];
}

- (IBAction)buttonEightTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 8];
}

- (IBAction)buttonNineTouch:(id)sender {
    _dishCountText.text = [NSString stringWithFormat:@"%d", 9];
}

- (IBAction)buttonConfirmTouch:(id)sender {
}

- (IBAction)buttonCancelTouch:(id)sender {
}
@end
