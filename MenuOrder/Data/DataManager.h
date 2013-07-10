//
//  DataManager.h
//  MenuOrder
//
//  Created by spmno on 13-7-3.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManagerDelegate.h"
#import "VersionDownloadWorker.h"
#import "UpdateJsonDownloadWorker.h"

@interface DataManager : NSObject<VersionDownloadDelegate, PageDownloadDelegate>
{
    VersionDownloadWorker *_versionWorker;
    UpdateJsonDownloadWorker  *_pageWorker;
}
+ (DataManager*) sharedInstance;
- (void) getAppVersion;
@property (strong, nonatomic) NSMutableArray *wholePageContainer;
@property (strong, nonatomic) NSNumber *versionNumber;
@property (strong, nonatomic) id<DataManagerDelegate> delegate;
@end
