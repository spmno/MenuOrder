//
//  VersionCheckController.h
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Data/DataManager.h"
@interface VersionCheckController : UIViewController<DataManagerDelegate>
{
    BOOL isLastVersion;
}
@property (strong, nonatomic) IBOutlet UILabel *checkInfo;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UITextField *tableNumberField;
@property (strong, nonatomic) IBOutlet UILabel *tableNumberLabel;
@property (strong, nonatomic) IBOutlet UITextField *memberNumberField;
@property (strong, nonatomic) IBOutlet UILabel *memberNumberLabel;
- (IBAction)switch2UpdateController:(id)sender;

@end
