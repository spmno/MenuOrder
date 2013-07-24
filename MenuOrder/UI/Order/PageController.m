//
//  PageController.m
//  MenuOrder
//
//  Created by spmno on 13-7-24.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PageController.h"
#import "../../Data/DisplayPage.h"
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
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
