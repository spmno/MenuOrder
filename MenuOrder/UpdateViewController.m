//
//  UpdateViewController.m
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "UpdateViewController.h"
#import "UpdateJsonDownloadWorker.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

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
    UpdateJsonDownloadWorker *updateJsonWorker = [[UpdateJsonDownloadWorker alloc] init];
    [updateJsonWorker startDownloadUpdateJson];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
