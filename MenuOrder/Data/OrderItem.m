//
//  OrderItem.m
//  MenuOrder
//
//  Created by qingpeng-sun on 7/31/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import "OrderItem.h"

@implementation OrderItem
- (id) copyWithZone:(NSZone *)zone
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = self.dish;
    orderItem.count = self.count;
    return orderItem;
}
@end
