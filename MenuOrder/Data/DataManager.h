//
//  DataManager.h
//  MenuOrder
//
//  Created by spmno on 13-7-3.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
@private
    NSMutableData *receivedData;
}
+ (DataManager*) sharedInstance;
- (NSString*) getAppVersion;
@end
