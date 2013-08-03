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
    _orderContainer = [[NSMutableArray alloc] init];
    return [super init];
}

- (void) addDishToOrder:(Dish *)dish withCount:(NSInteger)count
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = dish;
    orderItem.count = [NSNumber numberWithInt:count];
    //[_orderContainer setObject:dish.id forKey:orderItem];
    [_orderContainer addObject:orderItem];
}

- (void) deleteDishFromOrder:(int)dishId
{
    //[_orderContainer removeObjectForKey:dish.id];
    [_orderContainer removeObjectAtIndex:dishId];
}

- (void) setCurrentDish:(Dish *)dish
{
    currentDish = dish;
}

- (void) addCountToCurrentDish:(NSInteger)count
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = currentDish;
    orderItem.count = [NSNumber numberWithInt:count];
    //[_orderContainer setObject:currentDish.id forKey:orderItem];
    [_orderContainer addObject:orderItem];
}

@end
