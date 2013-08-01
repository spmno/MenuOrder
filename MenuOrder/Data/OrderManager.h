//
//  OrderManager.h
//  MenuOrder
//
//  Created by qingpeng-sun on 7/31/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish.h"
#import "OrderItem.h"
@interface OrderManager : NSObject
{
    NSMutableDictionary *orderContainer;
}
+ (OrderManager*) sharedInstance;
- (void) addDishToOrder : (Dish*) dish withCount: (NSInteger) count;
- (void) deleteDishFromOrder : (Dish*) dish;
@end
