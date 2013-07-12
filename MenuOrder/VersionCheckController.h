//
//  VersionCheckController.h
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data/DataManager.h"
@interface VersionCheckController : UIViewController<DataManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *checkInfo;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
- (IBAction)switch2UpdateController:(id)sender;

@end
