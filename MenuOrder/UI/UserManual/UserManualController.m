//
//  UserManualController.m
//  MenuOrder
//
//  Created by spmno on 13-6-9.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "UserManualController.h"

@interface UserManualController ()

@end

@implementation UserManualController

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

- (IBAction)exitUserManual:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NO];
}
@end
