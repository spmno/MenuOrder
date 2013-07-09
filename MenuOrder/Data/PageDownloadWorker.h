//
//  PageDownloadWorker.h
//  MenuOrder
//
//  Created by spmno on 13-7-7.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageDownloadDelegate.h"
@interface PageDownloadWorker : NSObject
{
    id<PageDownloadDelegate> delegate;
@private
    NSMutableData *receivedData;
}

@property (strong, nonatomic) id delegate;

- (BOOL) startDownloadPage;
@end
