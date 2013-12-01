//
//  VersionCheckController.m
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "VersionCheckController.h"
#import "PersistentData.h"
#import "UpdateViewController.h"
#import "KindSelectController.h"
#import "../../Data/OrderManager.h"

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
    //UIImage *background = [UIImage imageNamed: @"login_background.png"];
    //UIImageView *imageView = [[UIImageView alloc] initWithImage: background];
    
    //[self.view addSubview: imageView];

    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
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
    DataManager *dataManager = [DataManager sharedInstance];
    NSNumber *versionOnApp = [persistenData getVersion];
    _actionButton.hidden = NO;
    if ([version isEqualToNumber:versionOnApp]) {
        _actionButton.titleLabel.text = @"开始";
        _checkInfo.text = @"已经是最新版本.";
        if ([dataManager initDataFromDisk] == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:@"init data fail" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"YES", nil];
            [alert show];
        }
        isLastVersion = YES;
    } else {
        _actionButton.titleLabel.text = @"升级";
        _checkInfo.text = @"It is not last version, please update.";
    }
}


- (IBAction)switch2UpdateController:(id)sender
{
    //UpdateViewController *updateViewController = [[UpdateViewController alloc] init];
    if (isLastVersion) {
        OrderManager *orderManager = [OrderManager sharedInstance];
        orderManager.memberNo = [NSNumber numberWithInteger:[_memberNumberField.text integerValue]];
        orderManager.tableNo = [NSNumber numberWithInteger:[_tableNumberField.text integerValue]];
        KindSelectController *kindSelectController = [[KindSelectController alloc] initWithNibName:@"KindSelectController" bundle:nil];
        [self.navigationController pushViewController: kindSelectController animated:YES];
    } else {
        UpdateViewController* updateViewController = [[UpdateViewController alloc]initWithNibName:@"UpdateViewController" bundle:nil];
        //[self presentViewController:updateViewController animated:YES completion:nil];
        [self.navigationController pushViewController: updateViewController animated:YES];
    }

    //[self.navigationController pushViewController: updateViewController animated:YES];
    
}
@end
