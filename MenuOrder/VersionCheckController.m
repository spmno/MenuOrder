//
//  VersionCheckController.m
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "VersionCheckController.h"
#import "PersistentData.h"
@interface VersionCheckController ()

@end

@implementation VersionCheckController

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
    _actionButton.hidden = YES;
    _checkInfo.text = @"check version now, please wait!!!";
    DataManager *manager =[DataManager sharedInstance];
    manager.delegate = self;
    [manager getAppVersion];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didFinishVersionLoading:(NSNumber *)version
{
    PersistentData *persistenData = [[PersistentData alloc] init];
    NSNumber *versionOnApp = [persistenData getVersion];
    _actionButton.hidden = NO;
    if ([version isEqualToNumber:versionOnApp]) {
        _actionButton.titleLabel.text = @"start";
        _checkInfo.text = @"It is the last version.";
    } else {
        _actionButton.titleLabel.text = @"update";
        _checkInfo.text = @"It is not last version, please update.";
    }
}

- (void) didFinishPageLoading
{
    
}

@end
