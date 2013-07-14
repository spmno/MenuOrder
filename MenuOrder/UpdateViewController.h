//
//  UpdateViewController.h
//  MenuOrder
//
//  Created by spmno on 13-7-10.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data/DataManager.h"
@interface UpdateViewController : UIViewController<DataManagerDelegate>
{
    int updateInfoAppCount;
    int currentUpdateCount;
}
@property (strong, nonatomic) IBOutlet UIProgressView *updateProgress;
@property (strong, nonatomic) IBOutlet UILabel *updateFileName;
@property (strong, nonatomic) IBOutlet UILabel *updateInfo;
@property (strong, nonatomic) IBOutlet UIButton *switch2App;

@end
