//
//  OrderItem.h
//  MenuOrder
//
//  Created by qingpeng-sun on 7/31/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish.h"
@interface OrderItem : NSObject<NSCopying>
@property (strong, nonatomic) Dish* dish;
@property (strong, nonatomic) NSNumber *count;
@end
