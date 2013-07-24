//
//  Dish.h
//  MenuOrder
//
//  Created by qingpeng-sun on 7/24/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dish : NSObject
@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSNumber *price;
@end
