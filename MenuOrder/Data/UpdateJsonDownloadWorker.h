//
//  PageDownloadWorker.h
//  MenuOrder
//
//  Created by spmno on 13-7-7.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UpdateJsonDownloadDelegate.h"
@interface UpdateJsonDownloadWorker : NSObject
{
@private
    NSMutableData *receivedData;
}
@property (strong, nonatomic) id<UpdateJsonDownloadDelegate> delegate;
@property (weak, nonatomic) NSMutableArray *pageArray;
@property (weak, nonatomic) NSMutableArray *kindArray;
@property (assign, nonatomic) int appInfoCount;
- (BOOL) startDownloadUpdateJson : (NSMutableArray*) pageContainer :(NSMutableArray*) kindContainer;
@end
