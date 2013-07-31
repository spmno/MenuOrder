//
//  OrderManager.m
//  MenuOrder
//
//  Created by qingpeng-sun on 7/31/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import "OrderManager.h"

@implementation OrderManager
+ (OrderManager*) sharedInstance
{
    static OrderManager *sharedOrderManagerInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedOrderManagerInstance = [[OrderManager alloc] init];
    });
    return sharedOrderManagerInstance;
}


@end
