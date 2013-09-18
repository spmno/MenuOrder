//
//  EndViewController.m
//  MenuOrder
//
//  Created by spmno on 13-9-15.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "EndViewController.h"
#import "KindSelectController.h"
#import "VersionCheckController.h"

@interface EndViewController ()

@end

@implementation EndViewController

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

- (IBAction)reselectOrder:(id)sender {
    //VersionCheckController* versionCheckController = [[VersionCheckController alloc]initWithNibName:@"VersionCheckController" bundle:nil];
    //[self presentViewController:beforeController animated:NO completion:nil];
    if (self.navigationController != nil) {
        //[self.navigationController pushViewController:versionCheckController animated:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    //[self presentViewController:versionCheckController animated:YES completion:nil];
}
@end
