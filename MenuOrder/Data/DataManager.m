//
//  DataManager.m
//  MenuOrder
//
//  Created by spmno on 13-7-3.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
+ (DataManager*) sharedInstance
{
    static DataManager *shareDataManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDataManagerInstance = [[self alloc] init];
    });
    return shareDataManagerInstance;
}
@end
