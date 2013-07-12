//
//  DishKindDownloadWorker.h
//  MenuOrder
//
//  Created by spmno on 13-7-11.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DishKindDownloadDelegate.h"

@interface DishKindDownloadWorker : NSObject
{
@private
    NSMutableArray *downloadContainer;
    NSMutableArray *imagePathContainer;
    NSMutableData *receivedData;
}

@property (weak, nonatomic) id<DishKindDownloadDelegate> delegate;

- (void) startDownloadDishKind : (NSMutableArray*)kinds;
@end
