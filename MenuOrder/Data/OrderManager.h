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
#import "OrderManagerDelegate.h"
@interface OrderManager : NSObject
{
    Dish *currentDish;
@private
    NSMutableData *receivedData;
}
+ (OrderManager*) sharedInstance;
- (void) setCurrentDish : (Dish*) dish;
- (void) addCountToCurrentDish : (NSInteger) count;
- (void) addDishToOrder : (Dish*) dish withCount: (NSInteger) count;
- (void) deleteDishFromOrder : (int) dishId;
- (BOOL) sendOrderToServer;
@property (strong, nonatomic) NSMutableArray *orderContainer;
@property (strong, nonatomic) NSNumber *tableNo;
@property (strong, nonatomic) NSNumber *memberNo;
@property (weak, nonatomic) id<OrderManagerDelegate> delegate;
@end
