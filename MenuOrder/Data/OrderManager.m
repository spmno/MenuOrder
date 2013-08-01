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

- (id) init
{
    orderContainer = [[NSMutableDictionary alloc] init];
    return [super init];
}

- (void) addDishToOrder:(Dish *)dish withCount:(NSInteger)count
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = dish;
    orderItem.count = [NSNumber numberWithInt:count];
    [orderContainer setObject:dish.id forKey:orderItem];
}

- (void) deleteDishFromOrder:(Dish *)dish
{
    [orderContainer removeObjectForKey:dish.id];
}
@end
