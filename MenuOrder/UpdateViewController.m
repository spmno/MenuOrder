//
//  UpdateViewController.m
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "UpdateViewController.h"
#import "UpdateJsonDownloadWorker.h"
#import "DataManager.h"
#import "PersistentData.h"

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
    //UpdateJsonDownloadWorker *updateJsonWorker = [[UpdateJsonDownloadWorker alloc] init];
    //[updateJsonWorker startDownloadUpdateJson];
    DataManager *dataManager = [DataManager sharedInstance];
    dataManager.delegate = self;
    [dataManager getUpdateJsons];
    [_updateProgress setProgress:0];
    [_updateInfo setText:@"正在下载，请稍后"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didFinishAppInfoLoading : (int) appInfoCount
{
    updateInfoAppCount = appInfoCount;
    currentUpdateCount = 1;
    DataManager *dataManager = [DataManager sharedInstance];
    [dataManager getAppData];
}

- (void) downloadAppInfoStep:(NSString *)itemName
{
    float progressValue = currentUpdateCount * (1.0/updateInfoAppCount);
    [_updateProgress setProgress:progressValue];
    [_updateFileName setText:itemName];
    
    if (currentUpdateCount == updateInfoAppCount) {
        DataManager *dataManager = [DataManager sharedInstance];
        [_updateInfo setText:@"下载完毕，请进入应用"];
        PersistentData *persistenData = [[PersistentData alloc] init];
        int newVersion = [dataManager.versionNumber intValue];
        [persistenData saveVersion:newVersion];
        if ([persistenData savePages:dataManager.wholePageContainer]) {
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"init data failed" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"YES" , nil];
            [alert show];
        }
        if ([persistenData saveKinds:dataManager.wholeKindContainer]) {
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"init data failed" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"YES" , nil];
            [alert show];
        }
        return;
    }
    ++currentUpdateCount;
    
}

@end
