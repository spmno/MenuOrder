//
//  VersionDownWorker.h
//  MenuOrder
//
//  Created by spmno on 13-7-7.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionDownloadDelegate.h"
@interface VersionDownloadWorker : NSObject
{
@private
    NSMutableData *receivedData;
}

@property (weak, nonatomic) id<VersionDownloadDelegate> delegate;

- (BOOL) startDownloadVersion;
@end
