//
//  PageDownloadWorker.h
//  MenuOrder
//
//  Created by spmno on 13-7-11.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageDownloadDelegate.h"
@interface PageDownloadWorker : NSObject
{
@private
    NSMutableArray *downloadContainer;
    NSMutableArray *imagePathContainer;
    NSMutableData *receivedData;
    NSInteger currentDownloadIndex;
}

- (void) startDownloadPages : (NSMutableArray*)pages;
@property (weak, nonatomic) id<PageDownloadDelegate> delegate;
@end
