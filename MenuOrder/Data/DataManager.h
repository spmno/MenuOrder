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
#import "PageDownloadWorker.h"

@interface DataManager : NSObject<VersionDownloadDelegate, PageDownloadDelegate>
{
    id<DataManagerDelegate> delegate;
    VersionDownloadWorker *_versionWorker;
    PageDownloadWorker  *_pageWorker;
}
+ (DataManager*) sharedInstance;
- (NSString*) getAppVersion;
@property (strong, nonatomic) NSMutableArray *wholePageContainer;
@property (strong, nonatomic) NSNumber *versionNumber;
@end
